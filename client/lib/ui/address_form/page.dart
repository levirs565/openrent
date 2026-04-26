import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:openrent_client/ui/address_form/cubit.dart';
import 'package:openrent_client/ui/address_form/state.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
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
            title: Text(id == null ? 'Tambah Alamat' : 'Edit Alamat'),
            centerTitle: true,
            elevation: 0,
          ),
          body: _AddressFormContent(),
        ),
      ),
    );
  }
}

typedef _AddressFormTextField =
    ControlledTextField<AddressFormCubit, AddressFormState>;

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
              content: Text(state.error!.message),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.isLoading) const LinearProgressIndicator(),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Lokasi alamat',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Icon(
                            Icons.place_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(height: 210, child: _AddressFormMap()),
                      ),
                      const SizedBox(height: 14),
                      FilledButton.tonal(
                        onPressed: !state.canEdit
                            ? null
                            : () async {
                                final state = context
                                    .read<AddressFormCubit>()
                                    .state;
                                final result = await Navigator.of(context).push(
                                  MapPickerPage.routeForResult(
                                    position: state.position,
                                  ),
                                );
                                if (result != null) {
                                  context
                                      .read<AddressFormCubit>()
                                      .onChangeLocation(
                                        result.position,
                                        result.geocodingResult,
                                      );
                                }
                              },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Ubah Titik Alamat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _AddressFormTextField(
                        selector: (state) => state.name,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: !state.canEdit,
                          onChanged: (name) => context
                              .read<AddressFormCubit>()
                              .onNameChanged(name),
                          decoration: const InputDecoration(
                            labelText: 'Label Alamat',
                            hintText: 'Contoh: Rumah, Kantor, dll',
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _AddressFormTextField(
                        selector: (state) => state.province,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Provinsi',
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _AddressFormTextField(
                        selector: (state) => state.regency,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten/Kota',
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _AddressFormTextField(
                        selector: (state) => state.district,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: !state.canEdit,
                          onChanged: (district) => context
                              .read<AddressFormCubit>()
                              .onDistrictChanged(district),
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            hintText: 'Contoh: Kec. Gambir',
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _AddressFormTextField(
                        selector: (state) => state.detail,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: !state.canEdit,
                          onChanged: (detail) => context
                              .read<AddressFormCubit>()
                              .onDetailChanged(detail),
                          decoration: const InputDecoration(
                            labelText: 'Detail Alamat',
                            hintText: 'Contoh: Jl. Merdeka No. 123',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LoadingButton(
                isLoading: state.submissionStatus == .loading,
                onPressed: state.canSubmit
                    ? () {
                        context.read<AddressFormCubit>().onSubmit();
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    state.id == null ? 'Tambah Alamat' : 'Simpan Perubahan',
                  ),
                ),
              ),
            ],
          ),
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
