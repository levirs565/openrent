import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/ui/address_form/page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit.dart';
import 'state.dart';

class MapPickerResult {
  final LatLng position;
  final ReverseGeocodingResult geocodingResult;

  MapPickerResult({required this.position, required this.geocodingResult});
}

class MapPickerPage extends StatelessWidget {
  final LatLng? position;
  final bool isForResult;

  const MapPickerPage({super.key, this.position, required this.isForResult});

  static Route<void> routeForAdd({required LatLng? position}) {
    return MaterialPageRoute<void>(
      builder: (_) => MapPickerPage(position: position, isForResult: false),
    );
  }

  static Route<MapPickerResult> routeForResult({required LatLng? position}) {
    return MaterialPageRoute<MapPickerResult>(
      builder: (_) => MapPickerPage(position: position, isForResult: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapPickerCubit(
        locationRepository: context.read(),
        position: position,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("Point Location")),
        body: _AddAddressPageContent(isForResult: isForResult),
      ),
    );
  }
}

class _AddAddressPageContent extends StatelessWidget {
  final bool isForResult;

  const _AddAddressPageContent({super.key, required this.isForResult});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapPickerCubit, MapPickerState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MapPickerCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MapPickerCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter:
                    state.selectedPosition ?? LatLng(-7.771720, 110.412984),
                initialZoom: 9.2,
                onTap: (tapPosition, point) {
                  context.read<MapPickerCubit>().onSelectPosition(point);
                },
              ),
              children: [
                TileLayer(
                  // Bring your own tiles
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName:
                      "OpenRent/0.1 (contact: levirs565@gmail.com)",
                ),
                MarkerLayer(
                  markers: [
                    if (state.selectedPosition != null)
                      Marker(
                        alignment: Alignment.topCenter,
                        point: state.selectedPosition!,
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
          ),
          Row(
            children: [
              if (state.isLoading) ...[
                CircularProgressIndicator(),
                Expanded(child: Center()),
              ],
              if (state.reverseGeocodingResult != null)
                Expanded(
                  child: Text(
                    "${state.reverseGeocodingResult?.regency ?? "-"}, ${state.reverseGeocodingResult?.province ?? "-"}",
                  ),
                ),
              OutlinedButton(
                onPressed: !state.isValid
                    ? null
                    : () {
                        if (state.selectedPosition == null ||
                            state.reverseGeocodingResult == null)
                          return;
                        final result = MapPickerResult(
                          position: state.selectedPosition!,
                          geocodingResult: state.reverseGeocodingResult!,
                        );
                        if (isForResult) {
                          Navigator.of(context).pop(result);
                        } else {
                          Navigator.of(
                            context,
                          ).pushReplacement(AddressFormPage.routeAdd(position: result));
                        }
                      },
                child: Text("Select"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
