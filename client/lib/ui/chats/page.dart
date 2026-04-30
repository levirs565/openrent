import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/chat.dart';
import 'package:openrent_client/ui/chats/cubit.dart';
import 'package:openrent_client/ui/chats/state.dart';
import 'package:openrent_client/ui/messages/page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit(repository: context.read()),
      child: Scaffold(
        appBar: AppBar(title: Text("Chats")),
        body: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () => context.read<ChatsCubit>().onRefresh(),
              ),
            ),
          );
          context.read<ChatsCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => ListView.builder(
        itemCount: state.list.length,
        itemBuilder: (context, index) =>
            _Item(item: state.list.elementAt(index)),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ChatResponseItem item;

  const _Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MessagesPage.route(otherUserId: item.id)),
      title: Text(item.name),
      subtitle: Text(
        "${item.lastMessage.createdAt} - ${item.lastMessage.message}",
      ),
    );
  }
}
