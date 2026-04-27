import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/remote/product.dart';
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
          : _SearchResultMap(
              list: state.result,
              onClusterClicked: (list) => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                // TODO: Make it draggable
                builder: (context) => ListView.builder(
                  itemBuilder: (context, index) =>
                      ProductCard(item: state.result.elementAt(index)),
                  itemCount: state.result.length,
                ),
              ),
            ),
    );
  }
}

class _SearchResultMap extends StatelessWidget {
  final List<ProductResponseItemShort> list;
  final void Function(List<ProductResponseItemShort> items) onClusterClicked;

  const _SearchResultMap({
    super.key,
    required this.list,
    required this.onClusterClicked,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(-7.771720, 110.412984),
        initialZoom: 9.2,
        maxZoom: 20,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'OpenRent/0.1 (contact: levirs565@gmail.com)',
        ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 45,
            size: const Size(40, 40),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            maxZoom: 20,
            disableClusteringAtZoom: 100,
            spiderfyCluster: false,
            onClusterTap: (cluster) {
              onClusterClicked(
                cluster.markers
                    .map(
                      (marker) => list.firstWhere(
                        (item) =>
                            item.id == (marker.key as ValueKey<int>).value,
                      ),
                    )
                    .toList(),
              );
            },
            markers: list
                .map(
                  (item) => Marker(
                    key: ValueKey(item.id),
                    alignment: Alignment.center,
                    point: LatLng(item.address.lat, item.address.lng),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).push(ProductDetailPage.route(item.id)),
                      child: _MapItem(text: "1"),
                    ),
                  ),
                )
                .toList(),
            builder: (context, markers) =>
                _MapItem(text: markers.length.toString()),
          ),
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }
}

class _MapItem extends StatelessWidget {
  final String text;

  const _MapItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
