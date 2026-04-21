import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
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
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: Text(id == null ? "Add Product" : "Edit Product"),
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
              content: Text(state.error!.error.message),
              action: source == .submit
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
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          _ProductFormTextField(
            selector: (state) => state.name,
            builder: (controller) => TextField(
              controller: controller,
              readOnly: !state.canEdit,
              onChanged: (name) =>
                  context.read<ProductFormCubit>().onNameChanged(name),
              decoration: InputDecoration(label: Text("Name")),
            ),
          ),
          // TODO: Shortcut to add new address
          _ProductFormTextField(
            selector: (state) =>
                state.addressList
                    .firstWhereOrNull((item) => item.id == state.addressId)
                    ?.name ??
                "",
            builder: (controller) => DropdownMenu<int>(
              controller: controller,
              selectOnly: true,
              enabled: state.canEdit,
              label: Text("Address"),
              dropdownMenuEntries: state.addressList
                  .map(
                    (item) => DropdownMenuEntry(
                      value: item.id,
                      label: item.name,
                      labelWidget: Column(
                        children: [
                          Text(item.name),
                          Text(
                            "${item.detail}, ${item.district}, ${item.regency}, ${item.province}",
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onSelected: (value) =>
                  context.read<ProductFormCubit>().onAddressChanged(value),
            ),
          ),
          _ProductFormTextField(
            selector: (state) => state.pricePerDay?.toString() ?? "",
            builder: (controller) => TextField(
              controller: controller,
              readOnly: !state.canEdit,
              onChanged: (pricePerDay) => context
                  .read<ProductFormCubit>()
                  .onPricePerDayChanged(int.tryParse(pricePerDay)),
              decoration: InputDecoration(label: Text("Price Per Day")),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          _ProductFormTextField(
            selector: (state) => state.lateFeePerDay?.toString() ?? "",
            builder: (controller) => TextField(
              controller: controller,
              readOnly: !state.canEdit,
              onChanged: (lateFeePerDay) => context
                  .read<ProductFormCubit>()
                  .onLateFeePerDayChanged(int.tryParse(lateFeePerDay)),
              decoration: InputDecoration(label: Text("Late Fee Per Day")),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          _ProductFormTextField(
            selector: (state) => state.stock?.toString() ?? "",
            builder: (controller) => TextField(
              controller: controller,
              readOnly: !state.canEdit,
              onChanged: (stock) => context
                  .read<ProductFormCubit>()
                  .onStockChanged(int.tryParse(stock)),
              decoration: InputDecoration(label: Text("Stock")),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          _ProductFormTextField(
            selector: (state) => state.description,
            builder: (controller) => TextField(
              controller: controller,
              readOnly: !state.canEdit,
              onChanged: (description) => context
                  .read<ProductFormCubit>()
                  .onDescriptionChanged(description),
              decoration: InputDecoration(label: Text("Description")),
            ),
          ),
          OutlinedButton(
            onPressed: !state.canSubmit
                ? null
                : () => context.read<ProductFormCubit>().onSubmit(),
            child: Text(state.id == null ? "Add" : "Edit"),
          ),
        ],
      ),
    );
  }
}
