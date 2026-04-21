import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:openrent_client/ui/address_form/cubit.dart';
import 'package:openrent_client/ui/address_form/state.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/map_picker/page.dart';
import 'package:url_launcher/url_launcher.dart';

class AddressFormPage extends StatelessWidget {
  final int? id;
  final MapPickerResult? pickedLocation;

  const AddressFormPage({super.key, this.pickedLocation, this.id});

  static Route<void> routeAdd({required MapPickerResult position}) {
    return MaterialPageRoute<void>(
      builder: (_) => AddressFormPage(pickedLocation: position),
    );
  }

  static Route<void> routeEdit({required int id}) {
    return MaterialPageRoute<void>(builder: (_) => AddressFormPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AddressFormCubit(
          addressRepository: context.read(),
          id: id,
        );
        if (pickedLocation != null) {
          cubit.onChangeLocation(
            pickedLocation!.position,
            pickedLocation!.geocodingResult,
          );
        }
        return cubit;
      },
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: Text(id == null ? "Add Address" : "Edit Address"),
          ),
          body: _AddressFormContent(),
        ),
      ),
    );
  }
}

typedef _AddressFormTextField = ControlledTextField<AddressFormCubit, AddressFormState>;

class _AddressFormContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressFormCubit, AddressFormState>(
      listener: (context, state) {
        if (state.submissionStatus == .finished) {
          Navigator.of(context).pop();
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.error.message),
              action: state.error!.source == .submit
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () =>
                          context.read<AddressFormCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<AddressFormCubit>().onErrorHandled(state.error!);
        }
      },
      buildWhen: (previous, current) =>
          previous.canSubmit != current.canSubmit ||
          previous.canEdit != current.canEdit ||
          previous.isLoading != current.isLoading ||
          previous.id != current.id,
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            if (state.isLoading) LinearProgressIndicator(),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: _AddressFormMap(),
            ),
            OutlinedButton(
              onPressed: !state.canEdit
                  ? null
                  : () async {
                      final state = context.read<AddressFormCubit>().state;
                      final result = await Navigator.of(context).push(
                        MapPickerPage.routeForResult(position: state.position),
                      );
                      if (result != null) {
                        // TODO: Is isMounted nescesssary
                        context.read<AddressFormCubit>().onChangeLocation(
                          result.position,
                          result.geocodingResult,
                        );
                      }
                    },
              child: Text("Change Point"),
            ),
            _AddressFormTextField(
              selector: (state) => state.name,
              builder: (controller) => TextField(
                controller: controller,
                readOnly: !state.canEdit,
                onChanged: (name) =>
                    context.read<AddressFormCubit>().onNameChanged(name),
                decoration: InputDecoration(label: Text("Name")),
              ),
            ),
            _AddressFormTextField(
              selector: (state) => state.province,
              builder: (controller) => TextField(
                controller: controller,
                readOnly: !state.canEdit,
                onChanged: (province) => context
                    .read<AddressFormCubit>()
                    .onProvinceChanged(province),
                decoration: InputDecoration(label: Text("Province")),
              ),
            ),
            _AddressFormTextField(
              selector: (state) => state.regency,
              builder: (controller) => TextField(
                controller: controller,
                readOnly: !state.canEdit,
                onChanged: (regency) =>
                    context.read<AddressFormCubit>().onRegencyChanged(regency),
                decoration: InputDecoration(label: Text("Regency")),
              ),
            ),
            _AddressFormTextField(
              selector: (state) => state.district,
              builder: (controller) => TextField(
                controller: controller,
                readOnly: !state.canEdit,
                onChanged: (district) => context
                    .read<AddressFormCubit>()
                    .onDistrictChanged(district),
                decoration: InputDecoration(label: Text("District")),
              ),
            ),
            _AddressFormTextField(
              selector: (state) => state.detail,
              builder: (controller) => TextField(
                controller: controller,
                readOnly: !state.canEdit,
                onChanged: (detail) =>
                    context.read<AddressFormCubit>().onDetailChanged(detail),
                decoration: InputDecoration(label: Text("Detail")),
              ),
            ),
            OutlinedButton(
              onPressed: !state.canSubmit
                  ? null
                  : () {
                      context.read<AddressFormCubit>().onSubmit();
                    },
              child: Text(state.id == null ? "Add" : "Edit"),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressFormMap extends StatefulWidget {
  const _AddressFormMap({super.key});

  @override
  State<_AddressFormMap> createState() => _AddressFormMapState();
}

class _AddressFormMapState extends State<_AddressFormMap> {
  final controller = MapController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressFormCubit, AddressFormState>(
      listenWhen: (prev, curr) => prev.position != curr.position,
      listener: (context, state) {
        controller.move(state.position, 9.2);
      },
      builder: (context, state) => FlutterMap(
        mapController: controller,
        options: MapOptions(
          initialCenter: state.position,
          initialZoom: 9.2,
          interactionOptions: InteractionOptions(flags: InteractiveFlag.none),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: "OpenRent/0.1 (contact: levirs565@gmail.com)",
          ),
          MarkerLayer(
            markers: [
              Marker(
                alignment: Alignment.topCenter,
                point: state.position,
                width: 48,
                height: 48,
                child: Icon(Icons.location_on, size: 48),
              ),
            ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                ), // (external)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
