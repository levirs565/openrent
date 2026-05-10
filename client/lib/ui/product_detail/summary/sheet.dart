import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

import 'cubit.dart';
import 'state.dart';

class ProductSummarySheet extends StatelessWidget {
  final int id;

  const ProductSummarySheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductSummaryCubit(productRepository: context.read(), id: id),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ringkasan Produk',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              BlocBuilder<ProductSummaryCubit, ProductSummaryState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 48),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state.error != null) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.error,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.error!.message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            onPressed: () =>
                                context.read<ProductSummaryCubit>().onRefresh(),
                            icon: const Icon(Icons.refresh),
                            label: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    );
                  }

                  return MarkdownBody(
                    data: state.summary ?? 'Tidak ada ringkasan tersedia.',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
