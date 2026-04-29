import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/messages/cubit.dart';
import 'package:openrent_client/ui/messages/state.dart';

class MessagesPage extends StatelessWidget {
  final int otherUserId;

  const MessagesPage({super.key, required this.otherUserId});

  static Route<void> route({required int otherUserId}) {
    return MaterialPageRoute<void>(
      builder: (_) => MessagesPage(otherUserId: otherUserId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: BlocProvider(
        create: (context) =>
            MessagesCubit(otherUserId: otherUserId, repository: context.read()),
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: state.error!.source == .actionSend
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () =>
                          context.read<MessagesCubit>().onRefresh(),
                    ),
            ),
          );
          context.read<MessagesCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text("Messages"),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.isLoading) LinearProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) => _Item(item: state.list[index]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ControlledTextField<MessagesCubit, MessagesState>(
                    selector: (state) => state.currentMessage,
                    builder: (controller) => TextField(
                      readOnly: !state.canEdit,
                      decoration: InputDecoration(),
                      controller: controller,
                      onChanged: (message) => context
                          .read<MessagesCubit>()
                          .onCurrentMessageChanged(message),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: !state.canSubmit
                      ? null
                      : () => context.read<MessagesCubit>().onSend(),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final MessageResponseItem item;

  const _Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: item.currentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Card(
          child: Column(
            children: [
              Text(item.message ?? ""),
              Text(item.createdAt.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
