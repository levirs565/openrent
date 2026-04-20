import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/address.dart';
import 'package:openrent_client/ui/address_form/page.dart';
import 'package:openrent_client/ui/map_picker/page.dart';
import 'package:openrent_client/ui/my_addresses/cubit.dart';
import 'package:openrent_client/ui/my_addresses/state.dart';

// TODO: Refresh
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
          appBar: AppBar(title: Text("My Address")),
          body: _MyAddressesPageContent(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MapPickerPage.routeForAdd(position: null)),
            child: Icon(Icons.add),
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
              content: Text(state.error!.error.message),
              action: state.error!.source == .action ? null : SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<MyAddressesCubit>().onRefresh(),
              ),
            ),
          );
          context.read<MyAddressesCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Column(
        children: [
          if (state.isLoading) LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) => _MyAddressItem(
                item: state.data.elementAt(index),
                canAction: !state.isLoading,
              ),
            ),
          ),
        ],
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
      child: Column(
        children: [
          Text(item.name),
          Text(
            "${item.detail}, ${item.district}, ${item.regency}, ${item.province}",
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(AddressFormPage.routeEdit(id: item.id)),
                child: Text("Edit"),
              ),
              OutlinedButton(
                onPressed: !canAction
                    ? null
                    : () => context.read<MyAddressesCubit>().onDelete(item.id),
                child: Text("Hapus"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
