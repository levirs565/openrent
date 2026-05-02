import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/messages/page.dart';
import 'package:openrent_client/ui/product_reviews/page.dart';
import 'package:openrent_client/ui/rent_form/sheet.dart';

import 'cubit.dart';
import 'state.dart';

/* TODO Rent dynamic stock chat */

class ProductDetailPage extends StatelessWidget {
  final int id;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => ProductDetailPage(id: id));
  }

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
        id: id,
        productRepository: context.read(),
        exchangeRatesRepository: context.read(),
        settingsRepository: context.read(),
      ),
      child: ScaffoldMessenger(child: _ProductDetailPageContent()),
    );
  }
}

class _ProductDetailPageContent extends StatelessWidget {
  static String formatAddress(ProductAddress address) {
    return "${address.detail}, ${address.district}, ${address.regency}, ${address.province}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailCubit, ProductDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () {
                  final cubit = context.read<ProductDetailCubit>();
                  if (source == .data) {
                    cubit.onRefresh();
                  } else {
                    cubit.onRefreshExchangeRate();
                  }
                },
              ),
            ),
          );
          context.read<ProductDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text(state.data?.name ?? "")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (state.isLoading) LinearProgressIndicator(),
              if (state.data?.imageUrl != null)
                Image.network(state.data!.imageUrl!),
              Text(
                "Price: ${state.data?.pricePerDay ?? "-"} IDR per day or ${state.convertToCurrency(state.data?.pricePerDay)} per day",
              ),
              Text(
                "Late: ${state.data?.lateFeePerDay ?? "-"} per day or ${state.convertToCurrency(state.data?.lateFeePerDay)} per day",
              ),
              Text(
                "Address: ${state.data != null ? formatAddress(state.data!.address) : "-"}",
              ),
              Text("Stock ${state.data?.stock ?? "-"}"),
              Text("User ${state.data?.user.name}"),
              Text("Descrption:"),
              Text(state.data?.description ?? "-"),
              Text("Reccomendation"),
              ...(state.data?.recommendations
                      .map(
                        (item) => ProductCard(
                          item: item,
                          currency: state.selectedCurrency,
                          convertToCurrency: state.convertToCurrency,
                        ),
                      )
                      .toList() ??
                  List.empty()),
              Text("Reviews"),
              ...(state.data?.topReviews
                      .map((item) => ReviewCard(item: item))
                      .toList() ??
                  List.empty()),
              OutlinedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(ProductReviewsPage.route(state.id)),
                child: Text("See More Reviews"),
              ),
              OutlinedButton(
                onPressed: () => {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => RentFormSheet(id: state.id),
                  ),
                },
                child: Text("Rent"),
              ),
              BlocBuilder<AuthBloc, AuthBlocState>(
                builder: (context, authState) {
                  final user = authState.state;

                  if (user is AuthStateSuccess &&
                      user.user?.id != state.data?.user.id) {
                    return OutlinedButton(
                      onPressed: state.data?.user == null
                          ? null
                          : () => Navigator.of(context).push(
                              MessagesPage.route(
                                otherUserId: state.data!.user.id,
                              ),
                            ),
                      child: Text("Chat"),
                    );
                  }
                  return Center();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
