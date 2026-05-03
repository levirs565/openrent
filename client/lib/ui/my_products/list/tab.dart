import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/components/info_chip.dart';
import 'package:openrent_client/ui/my_product_detail/page.dart';
import 'package:openrent_client/ui/my_products/list/cubit.dart';
import 'package:openrent_client/ui/my_products/list/state.dart';
import 'package:openrent_client/ui/product_form/page.dart';

class MyProductListTab extends StatelessWidget {
  const MyProductListTab({super.key});

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyProductListTab());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyProductListCubit(productRepository: context.read()),
      child: BlocConsumer<MyProductListCubit, MyProductListState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!.message),
                action: SnackBarAction(
                  label: 'Refresh',
                  onPressed: () =>
                      context.read<MyProductListCubit>().onRefresh(),
                ),
              ),
            );
            context.read<MyProductListCubit>().onErrorHandled(state.error!);
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
                      'Produk Anda',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () =>
                        Navigator.of(context).push(ProductFormPage.routeAdd()),
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah Produk'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(140, 48),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (state.isLoading) const LinearProgressIndicator(),
              if (state.isLoading) const SizedBox(height: 16),
              Expanded(
                child: state.data.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada produk. Tambahkan produk agar penyewa dapat melihatnya.',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            _MyProductsItem(item: state.data.elementAt(index)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyProductsItem extends StatelessWidget {
  final MyProductResponseItemShort item;

  const _MyProductsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () =>
            Navigator.of(context).push(MyProductDetailPage.route(item.id)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: item.imageUrl != null
                    ? Image.network(
                        item.imageUrl!,
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
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Rp ${item.pricePerDay}/hari • ${item.stock} stok',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.address.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (item.rentCount.pending > 0)
                          InfoChip(
                            label: 'Menunggu: ${item.rentCount.pending}',
                          ),
                        if (item.rentCount.ready > 0)
                          InfoChip(label: 'Siap: ${item.rentCount.ready}'),
                        if (item.rentCount.onRent > 0)
                          InfoChip(
                            label: 'Sedang Disewa: ${item.rentCount.onRent}',
                          ),
                        if (item.rentCount.pendingReturn > 0)
                          InfoChip(
                            label:
                                'Menunggu Pengembalian: ${item.rentCount.pendingReturn}',
                          ),
                        if (item.rentCount.late > 0)
                          InfoChip(label: 'Terlambat: ${item.rentCount.late}'),
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
