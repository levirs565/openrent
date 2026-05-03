import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:intl/intl.dart';
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
      create: (context) => SearchCubit(
        repository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
        locationRepository: context.read(),
      ),
      child: Column(
        children: [
          BlocListener<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state.error != null) {
                final source = state.error!.source;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error!.message),
                    action: source == .data
                        ? null
                        : SnackBarAction(
                            label: "Refresh",
                            onPressed: () => context
                                .read<SearchCubit>()
                                .onRefreshExchangeRate(),
                          ),
                  ),
                );
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

final _dateFormat = DateFormat('dd MMM yyyy');

class _SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) => Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: state.disableAISearch,
                onChanged: (value) => context
                    .read<SearchCubit>()
                    .onDisableAISearchChanged(value ?? !state.disableAISearch),
              ),
              Text("Disable AI search")
            ],
          ),
          TextField(
            decoration: InputDecoration(label: Text("Keyword")),
            enabled: state.canEdit,
            onChanged: (keyword) =>
                context.read<SearchCubit>().onKeywordChanged(keyword),
          ),
          Row(
            children: [
              Text(
                "${state.startDate == null ? "null" : _dateFormat.format(state.startDate!)} - ${state.endDate == null ? "null" : _dateFormat.format(state.endDate!)}",
              ),
              OutlinedButton(
                onPressed: !state.canEdit
                    ? null
                    : () async {
                        final result = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.utc(2099, 12, 30),
                          initialDateRange:
                              state.startDate == null || state.endDate == null
                              ? null
                              : DateTimeRange(
                                  start: state.startDate!,
                                  end: state.endDate!,
                                ),
                        );
                        if (result == null) return;

                        if (!context.mounted) return;
                        context.read<SearchCubit>().onDateRangeChanged(
                          result.start,
                          result.end,
                        );
                      },
                child: Text("Change"),
              ),
              OutlinedButton(
                onPressed: !state.canEdit
                    ? null
                    : () => context.read<SearchCubit>().onDateRangeChanged(
                        null,
                        null,
                      ),
                child: Text("Clear"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) => !state.isMapView
          ? ListView.builder(
              itemBuilder: (context, index) => ProductCard(
                item: state.result.elementAt(index),
                currency: state.selectedCurrency,
                convertToCurrency: state.convertToCurrency,
              ),
              itemCount: state.result.length,
            )
          : _SearchResultMap(
              currentPosition: state.currentPosition,
              list: state.result,
              onClusterClicked: (list) => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                // TODO: Make it draggable
                builder: (context) => ListView.builder(
                  itemBuilder: (context, index) => ProductCard(
                    item: state.result.elementAt(index),
                    currency: state.selectedCurrency,
                    convertToCurrency: state.convertToCurrency,
                  ),
                  itemCount: state.result.length,
                ),
              ),
            ),
    );
  }
}

class _SearchResultMap extends StatefulWidget {
  final List<ProductResponseItemShort> list;
  final LatLng? currentPosition;
  final void Function(List<ProductResponseItemShort> items) onClusterClicked;

  const _SearchResultMap({
    super.key,
    required this.list,
    required this.onClusterClicked,
    required this.currentPosition,
  });

  @override
  State<_SearchResultMap> createState() => _SearchResultMapState();
}

class _SearchResultMapState extends State<_SearchResultMap> {
  final MapController _controller = MapController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _SearchResultMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPosition == null && widget.currentPosition != null) {
      _controller.move(widget.currentPosition!, 9.2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _controller,
      options: MapOptions(
        initialCenter: widget.currentPosition ?? const LatLng(50.5, 30.51),
        initialZoom: 9.2,
        maxZoom: 20,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'OpenRent/0.1 (contact: levirs565@gmail.com)',
        ),
        MarkerLayer(
          markers: [
            if (widget.currentPosition != null)
              Marker(
                alignment: Alignment.topCenter,
                point: widget.currentPosition!,
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
              widget.onClusterClicked(
                cluster.markers
                    .map(
                      (marker) => widget.list.firstWhere(
                        (item) =>
                            item.id == (marker.key as ValueKey<int>).value,
                      ),
                    )
                    .toList(),
              );
            },
            markers: widget.list
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
