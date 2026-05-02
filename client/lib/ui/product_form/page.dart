import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/product_form/cubit.dart';
import 'package:openrent_client/ui/product_form/state.dart';

class ProductFormPage extends StatelessWidget {
  final int? id;

  const ProductFormPage({super.key, this.id});

  static Route<void> routeAdd() {
    return MaterialPageRoute<void>(builder: (_) => ProductFormPage());
  }

  static Route<void> routeEdit(int id) {
    return MaterialPageRoute<void>(builder: (_) => ProductFormPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFormCubit(
        id: id,
        addressRepository: context.read(),
        productRepository: context.read(),
        locationRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: Text(id == null ? "Tambah Produk" : "Edit Produk"),
          ),
          body: _ProductFormPageContent(),
        ),
      ),
    );
  }
}

typedef _ProductFormTextField =
    ControlledTextField<ProductFormCubit, ProductFormState>;

class _ProductFormPageContent extends StatelessWidget {
  const _ProductFormPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductFormCubit, ProductFormState>(
      listener: (context, state) {
        if (state.submissionStatus == .finished) {
          Navigator.of(context).pop();
        }
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: source == .submit || source == .nearbyAddress
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () {
                        final cubit = context.read<ProductFormCubit>();
                        if (source == .dataProduct) {
                          cubit.onRefreshProduct();
                        } else if (source == .dataAddress) {
                          cubit.onRefreshAddress();
                        }
                      },
                    ),
            ),
          );
          context.read<ProductFormCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.isLoading) const LinearProgressIndicator(),
                  if (state.isLoading) const SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _ProductFormTextField(
                            selector: (state) => state.name,
                            builder: (controller) => TextField(
                              controller: controller,
                              readOnly: !state.canEdit,
                              onChanged: (name) => context
                                  .read<ProductFormCubit>()
                                  .onNameChanged(name),
                              decoration: const InputDecoration(
                                labelText: 'Nama Produk',
                                hintText: 'Contoh: Kamera DSLR',
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          _ProductFormTextField(
                            selector: (state) =>
                                state.addressList
                                    .firstWhereOrNull(
                                      (item) => item.id == state.addressId,
                                    )
                                    ?.name ??
                                '',
                            builder: (controller) => DropdownMenu<int>(
                              expandedInsets: EdgeInsets.zero,
                              controller: controller,
                              selectOnly: true,
                              enabled: state.canEdit,
                              label: const Text('Alamat'),
                              dropdownMenuEntries: state.addressList
                                  .map(
                                    (item) => DropdownMenuEntry(
                                      value: item.id,
                                      label: item.name,
                                      labelWidget: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item.name),
                                          Text(
                                            '${item.detail}, ${item.district}, ${item.regency}, ${item.province}',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onSelected: (value) => context
                                  .read<ProductFormCubit>()
                                  .onAddressChanged(value),
                            ),
                          ),
                          const SizedBox(height: 8),
                          FilledButton.tonal(
                            onPressed: state.isNearbyAddressLoading
                                ? null
                                : () => context
                                      .read<ProductFormCubit>()
                                      .onSelectNearbyAddress(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text("Pilih Alamat Terdekat"),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: _ProductFormTextField(
                                  selector: (state) =>
                                      state.pricePerDay?.toString() ?? '',
                                  builder: (controller) => TextField(
                                    controller: controller,
                                    readOnly: !state.canEdit,
                                    onChanged: (pricePerDay) => context
                                        .read<ProductFormCubit>()
                                        .onPricePerDayChanged(
                                          int.tryParse(pricePerDay),
                                        ),
                                    decoration: const InputDecoration(
                                      labelText: 'Harga/hari',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: _ProductFormTextField(
                                  selector: (state) =>
                                      state.lateFeePerDay?.toString() ?? '',
                                  builder: (controller) => TextField(
                                    controller: controller,
                                    readOnly: !state.canEdit,
                                    onChanged: (lateFeePerDay) => context
                                        .read<ProductFormCubit>()
                                        .onLateFeePerDayChanged(
                                          int.tryParse(lateFeePerDay),
                                        ),
                                    decoration: const InputDecoration(
                                      labelText: 'Denda/hari',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: _ProductFormTextField(
                                  selector: (state) =>
                                      state.stock?.toString() ?? '',
                                  builder: (controller) => TextField(
                                    controller: controller,
                                    readOnly: !state.canEdit,
                                    onChanged: (stock) => context
                                        .read<ProductFormCubit>()
                                        .onStockChanged(int.tryParse(stock)),
                                    decoration: const InputDecoration(
                                      labelText: 'Stok',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          _ProductFormTextField(
                            selector: (state) => state.description,
                            builder: (controller) => TextField(
                              controller: controller,
                              readOnly: !state.canEdit,
                              onChanged: (description) => context
                                  .read<ProductFormCubit>()
                                  .onDescriptionChanged(description),
                              decoration: const InputDecoration(
                                labelText: 'Deskripsi',
                                hintText:
                                    'Berikan informasi penting tentang produk',
                              ),
                              maxLines: 4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          LoadingButton(
                            isLoading: state.submissionStatus == .loading,
                            onPressed: !state.canSubmit
                                ? null
                                : () => context
                                      .read<ProductFormCubit>()
                                      .onSubmit(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                state.id == null
                                    ? 'Tambah produk'
                                    : 'Simpan perubahan',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
