import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/data/remote/order.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/components/rental_status_label.dart';
import 'package:openrent_client/ui/my_order_detail/page.dart';
import 'package:openrent_client/ui/my_orders/cubit.dart';
import 'package:openrent_client/ui/my_orders/state.dart';
import 'package:openrent_client/ui/review_form/page.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(
        orderRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          body: const _Content(),
          appBar: AppBar(title: const Text("My Orders")),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyOrdersCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MyOrdersCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.list.isEmpty) {
          return const Center(child: Text('Kamu belum memiliki pesanan.'));
        }

        return RefreshIndicator(
          onRefresh: () async => context.read<MyOrdersCubit>().onRefresh(),
          child: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: state.list.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) =>
                _Item(item: state.list.elementAt(index)),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final OrderResponseItem item;

  const _Item({required this.item});

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy HH:mm').format(date);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () =>
            Navigator.of(context).push(MyOrderDetailPage.route(item.id)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: item.product.imageUrl != null
                          ? Image.network(
                              item.product.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.photo,
                              color: theme.colorScheme.onSurfaceVariant,
                              size: 40,
                            ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: theme.textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pemilik: ${item.user.name}',
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            InfoChip(
                              label:
                                  '${_formatDate(item.startDate)} - ${_formatDate(item.endDate)}',
                              // icon: Icons.date_range,
                            ),
                            InfoChip(
                              label: 'Jumlah: ${item.quantity}',
                              // icon: Icons.inventory_2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoChip(label: rentalStatusLabel(item.state)),
                  if (item.review == null && item.state == RentState.completed)
                    FilledButton(
                      onPressed: () => Navigator.of(
                        context,
                      ).push(ReviewFormPage.routeAdd(rentId: item.id)),
                      child: const Text("Beri Ulasan"),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
