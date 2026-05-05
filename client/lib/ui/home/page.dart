import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/home/cubit.dart';
import 'package:openrent_client/ui/home/state.dart';
import 'package:openrent_client/ui/search/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(context.read<ProductRepository>())..fetchProducts(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpenRent"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(SearchPage.route()),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.search),
                  // labelText: 'Cari barang',
                  prefixText: 'Cari barang...',
                  // hintText: "Cari barang...",
                ),
                child: const Text(""),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().fetchProducts(),
            child: state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              success: (products) => GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductCard(
                    item: item,
                    // TODO: Implement proper currency conversion
                    convertToCurrency: (amount) => null,
                    currency: '',
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
