import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/components/review_card.dart';
import 'package:openrent_client/ui/my_rental_detail/page.dart';
import 'package:openrent_client/ui/product_form/page.dart';
import 'package:openrent_client/ui/product_reviews/page.dart';

import 'cubit.dart';
import 'state.dart';

/* TODO delete */

class MyProductDetailPage extends StatelessWidget {
  final int id;

  static Route<void> route(int id) {
    return MaterialPageRoute<void>(builder: (_) => MyProductDetailPage(id: id));
  }

  const MyProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyProductDetailCubit(id: id, productRepository: context.read()),
      child: ScaffoldMessenger(child: _MyProductDetailPageContent()),
    );
  }
}

class _MyProductDetailPageContent extends StatelessWidget {
  static String formatAddress(MyProductAddress address) {
    return "${address.name} ${address.detail}, ${address.district}, ${address.regency}, ${address.province}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProductDetailCubit, MyProductDetailState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error?.source != .data
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () =>
                          context.read<MyProductDetailCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<MyProductDetailCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.data?.name ?? ""),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(
                context,
              ).push(ProductFormPage.routeEdit(state.id)),
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (state.isLoading) LinearProgressIndicator(),
              if (state.data?.imageUrl != null)
                Image.network(state.data!.imageUrl!),
              OutlinedButton(
                onPressed: !state.isCanUpload ? null : () async {
                  final cubit = context.read<MyProductDetailCubit>();
                  final picker = ImagePicker();
                  final file = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (file != null) {
                    cubit.onUploadImage(file);
                  }
                },
                child: Text("Upload Image"),
              ),
              Text("Price: ${state.data?.pricePerDay ?? "-"} per day"),
              Text("Late: ${state.data?.lateFeePerDay ?? "-"} per day"),
              Text(
                "Address: ${state.data != null ? formatAddress(state.data!.address) : "-"}",
              ),
              Text("Stock ${state.data?.stock ?? "-"}"),
              Text("Descrption:"),
              Text(state.data?.description ?? "-"),
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
              Text("Rents"),
              ...(state.data?.rents
                      .map((item) => _RentCard(item: item))
                      .toList() ??
                  List.empty()),
            ],
          ),
        ),
      ),
    );
  }
}

class _RentCard extends StatelessWidget {
  final MyProductRentItem item;

  const _RentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        onTap: () =>
            Navigator.of(context).push(MyRentalDetailPage.route(item.id)),
        child: Column(
          children: [
            Text("${item.user.name}"),
            Text("${item.startDate} - ${item.endDate}"),
            Text("${item.quantity} - ${item.state}"),
          ],
        ),
      ),
    );
  }
}
