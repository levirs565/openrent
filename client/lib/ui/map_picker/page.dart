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
        appBar: AppBar(title: const Text('Pilih titik lokasi di peta')),
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
      builder: (context, state) => SafeArea(
        child: Column(
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
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName:
                        'OpenRent/0.1 (contact: levirs565@gmail.com)',
                  ),
                  MarkerLayer(
                    markers: [
                      if (state.selectedPosition != null)
                        Marker(
                          alignment: Alignment.topCenter,
                          point: state.selectedPosition!,
                          width: 48,
                          height: 48,
                          child: Icon(
                            Icons.location_on,
                            size: 48,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                    ],
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(
                          Uri.parse('https://openstreetmap.org/copyright'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state.isLoading)
                        Column(
                          children: [
                            LinearProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 36),
                          ],
                        ),
                      if (state.reverseGeocodingResult != null) ...[
                        Text(
                          '${state.reverseGeocodingResult?.regency ?? '-'}, ${state.reverseGeocodingResult?.province ?? '-'}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                      ],
                      FilledButton(
                        onPressed: !state.isValid
                            ? null
                            : () {
                                if (state.selectedPosition == null ||
                                    state.reverseGeocodingResult == null) {
                                  return;
                                }
                                final result = MapPickerResult(
                                  position: state.selectedPosition!,
                                  geocodingResult:
                                      state.reverseGeocodingResult!,
                                );
                                if (isForResult) {
                                  Navigator.of(context).pop(result);
                                } else {
                                  Navigator.of(context).pushReplacement(
                                    AddressFormPage.routeAdd(position: result),
                                  );
                                }
                              },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Pilih Lokasi'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
