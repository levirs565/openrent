import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/ui/components/product_card.dart';
import 'package:openrent_client/ui/product/page.dart';
import 'package:openrent_client/ui/search/cubit.dart';
import 'package:openrent_client/ui/search/state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(repository: context.read()),
      child: Column(
        children: [
          BlocListener<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error!.message)));
                context.read<SearchCubit>().onErrorHandled(state.error!);
              }
            },
            child: Center(),
          ),
          _SearchInput(),
          Expanded(child: _SearchResult()),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text("Keyword")),
      onChanged: (keyword) =>
          context.read<SearchCubit>().onKeywordChanged(keyword),
    );
  }
}

class _SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) => ListView.builder(
        itemBuilder: (context, index) =>
            ProductCard(item: state.result.elementAt(index)),
        itemCount: state.result.length,
      ),
    );
  }
}
