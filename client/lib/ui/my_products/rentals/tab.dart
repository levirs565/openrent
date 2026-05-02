import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/data/remote/rental.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/components/rental_status_label.dart';
import 'package:openrent_client/ui/my_rental_detail/page.dart';

import 'cubit.dart';
import 'state.dart';

class MyRentalsTab extends StatelessWidget {
  const MyRentalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRentalsCubit(rentalRepository: context.read()),
      child: BlocConsumer<MyRentalsCubit, MyRentalsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!.message),
                action: SnackBarAction(
                  label: 'Refresh',
                  onPressed: () => context.read<MyRentalsCubit>().onRefresh(),
                ),
              ),
            );
            context.read<MyRentalsCubit>().onErrorHandled(state.error!);
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Rental Saya',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(
                    '${state.list.length} item',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (state.isLoading) const LinearProgressIndicator(),
              if (state.isLoading) const SizedBox(height: 16),
              Expanded(
                child: state.list.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada rental saat ini. Pesanan akan tampil di sini.',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.list.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            _RentalItem(item: state.list.elementAt(index)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RentalItem extends StatelessWidget {
  final RentalResponseItem item;

  const _RentalItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final dateLabel =
        '${DateFormat('dd/MM/yyyy').format(item.startDate)} - ${DateFormat('dd/MM/yyyy').format(item.endDate)}';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () =>
            Navigator.of(context).push(MyRentalDetailPage.route(item.id)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: item.product.imageUrl != null
                    ? Image.network(
                        item.product.imageUrl!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child: Icon(
                          Icons.photo,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.user.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      dateLabel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        InfoChip(label: rentalStatusLabel(item.state)),
                        InfoChip(label: 'Jumlah: ${item.quantity}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
