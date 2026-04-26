import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/search/cubit.dart';
import 'package:openrent_client/ui/search/state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../product_detail/page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(repository: context.read()),
      child: Column(
        children: [
          BlocListener<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error!.message)));
                context.read<SearchCubit>().onErrorHandled(state.error!);
              }
            },
            child: Center(),
          ),
          _SearchInput(),
          Expanded(child: _SearchResult()),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) => OutlinedButton(
              onPressed: () => context.read<SearchCubit>().onToggleView(),
              child: Text(state.isMapView ? "List" : "Map"),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text("Keyword")),
      onChanged: (keyword) =>
          context.read<SearchCubit>().onKeywordChanged(keyword),
    );
  }
}

class _SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) => !state.isMapView
          ? ListView.builder(
              itemBuilder: (context, index) =>
                  ProductCard(item: state.result.elementAt(index)),
              itemCount: state.result.length,
            )
          : FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(-7.771720, 110.412984),
                initialZoom: 9.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName:
                      'OpenRent/0.1 (contact: levirs565@gmail.com)',
                ),
                MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                    maxClusterRadius: 45,
                    size: const Size(40, 40),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(50),
                    maxZoom: 15,
                    spiderfyCluster: false,
                    onClusterTap: (cluster) {
                      showBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Bottom sheet'),
                              ElevatedButton(
                                child: const Text('Close'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    markers: state.result
                        .map(
                          (item) => Marker(
                            alignment: Alignment.topCenter,
                            point: LatLng(item.address.lat, item.address.lng),
                            width: 48,
                            height: 48,
                            child: GestureDetector(
                              onTap:  () => Navigator.of(context).push(ProductDetailPage.route(item.id)),
                              child: Icon(
                                Icons.location_on,
                                size: 48,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    builder: (context, markers) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            markers.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
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
    );
  }
}
