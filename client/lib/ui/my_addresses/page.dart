import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/address_form/page.dart';
import 'package:openrent_client/ui/map_picker/page.dart';
import 'package:openrent_client/ui/my_addresses/cubit.dart';
import 'package:openrent_client/ui/my_addresses/state.dart';

class MyAddressesPage extends StatelessWidget {
  const MyAddressesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => MyAddressesPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAddressesCubit(addressRepository: context.read()),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Alamat Saya'),
            centerTitle: true,
            elevation: 0,
          ),
          body: _MyAddressesPageContent(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.of(
              context,
            ).push(MapPickerPage.routeForAdd(position: null)),
            icon: const Icon(Icons.add),
            label: const Text('Tambah alamat'),
          ),
        ),
      ),
    );
  }
}

class _MyAddressesPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAddressesCubit, MyAddressesState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error!.source == .action
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () =>
                          context.read<MyAddressesCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<MyAddressesCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: LinearProgressIndicator(),
                ),
              Text(
                'Kelola alamat pengiriman dan lokasi properti Anda.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: state.data.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_off_outlined,
                              size: 68,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Belum ada alamat',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tambahkan alamat baru untuk mempercepat proses penawaran dan penyewaan.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _MyAddressItem(
                            item: state.data.elementAt(index),
                            canAction: !state.isLoading,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyAddressItem extends StatelessWidget {
  final AddressResponseItem item;
  final bool canAction;

  const _MyAddressItem({
    super.key,
    required this.item,
    required this.canAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.location_on_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${item.detail}, ${item.district}, ${item.regency}, ${item.province}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: () => Navigator.of(
                      context,
                    ).push(AddressFormPage.routeEdit(id: item.id)),
                    child: const Text('Edit'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: !canAction
                        ? null
                        : () => context.read<MyAddressesCubit>().onDelete(
                            item.id,
                          ),
                    child: const Text('Hapus'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
