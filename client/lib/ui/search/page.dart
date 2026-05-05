import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/product_detail/page.dart';
import 'package:openrent_client/ui/search/cubit.dart';
import 'package:openrent_client/ui/search/state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/timezone.dart' as tz;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        repository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
        locationRepository: context.read(),
      ),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
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
                      onPressed: () =>
                          context.read<SearchCubit>().onRefreshExchangeRate(),
                    ),
            ),
          );
          context.read<SearchCubit>().onErrorHandled(state.error!);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OpenRent'),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: _SearchInput(),
          ),
        ),
        body: const _SearchResult(),
      ),
    );
  }
}

final _dateFormat = DateFormat('dd MMM yyyy');

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (p, c) =>
          p.canEdit != c.canEdit ||
          p.disableAISearch != c.disableAISearch ||
          p.startDate != c.startDate ||
          p.endDate != c.endDate,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari Barang...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
                enabled: state.canEdit,
                onChanged: (keyword) =>
                    context.read<SearchCubit>().onKeywordChanged(keyword),
              ),
              const Gap(8),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: InkWell(
                        onTap: !state.canEdit
                            ? null
                            : () async {
                                final result = await showDateRangePicker(
                                  context: context,
                                  firstDate: tz.TZDateTime.now(state.timeZone),
                                  lastDate: DateTime.utc(2099, 12, 30),
                                  initialDateRange:
                                      state.startDate == null ||
                                          state.endDate == null
                                      ? null
                                      : DateTimeRange(
                                          start: state.startDate!,
                                          end: state.endDate!,
                                        ),
                                );
                                if (result == null || !context.mounted) return;
                                context.read<SearchCubit>().onDateRangeChanged(
                                  result.start,
                                  result.end,
                                );
                              },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.date_range_outlined),
                              const Gap(8),
                              Expanded(
                                child: Text(
                                  state.startDate == null ||
                                          state.endDate == null
                                      ? 'Pilih Tanggal Sewa'
                                      : '${_dateFormat.format(state.startDate!)} - ${_dateFormat.format(state.endDate!)}',
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                              if (state.startDate != null)
                                IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () => context
                                      .read<SearchCubit>()
                                      .onDateRangeChanged(null, null),
                                  tooltip: 'Hapus tanggal',
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  FilterChip(
                    label: const Text('AI'),
                    selected: !state.disableAISearch,
                    onSelected: (value) => context
                        .read<SearchCubit>()
                        .onDisableAISearchChanged(!value),
                  ),
                  const Gap(8),
                  BlocBuilder<SearchCubit, SearchState>(
                    buildWhen: (p, c) => p.isMapView != c.isMapView,
                    builder: (context, state) {
                      return IconButton(
                        icon: Icon(
                          state.isMapView
                              ? Icons.list_outlined
                              : Icons.map_outlined,
                        ),
                        onPressed: () =>
                            context.read<SearchCubit>().onToggleView(),
                        tooltip: state.isMapView
                            ? 'Lihat sebagai daftar'
                            : 'Lihat di peta',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.isSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.result.isEmpty) {
          return const Center(child: Text('Tidak ada hasil ditemukan.'));
        }

        if (state.isMapView) {
          return _SearchResultMap(
            key: const ValueKey('map_view'),
            currentPosition: state.currentPosition,
            list: state.result,
            onClusterClicked: (list) => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.5,
                maxChildSize: 0.9,
                builder: (context, scrollController) => ListView.builder(
                  controller: scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: ProductCard(
                        item: item,
                        currency: state.selectedCurrency,
                        convertToCurrency: state.convertToCurrency,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return ListView.builder(
            key: const ValueKey('list_view'),
            padding: const EdgeInsets.all(16),
            itemCount: state.result.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCard(
                item: state.result.elementAt(index),
                currency: state.selectedCurrency,
                convertToCurrency: state.convertToCurrency,
              ),
            ),
          );
        }
      },
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
        initialCenter: widget.currentPosition ?? const LatLng(-6.20, 106.81),
        initialZoom: 9.2,
        maxZoom: 20,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.levirs.openrent',
        ),
        if (widget.currentPosition != null)
          MarkerLayer(
            markers: [
              Marker(
                alignment: Alignment.topCenter,
                point: widget.currentPosition!,
                width: 48,
                height: 48,
                child: Icon(
                  Icons.my_location,
                  size: 32,
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
            disableClusteringAtZoom: 16,
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
                      child: _MapItem(text: '1'),
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

  const _MapItem({required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.primary,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
