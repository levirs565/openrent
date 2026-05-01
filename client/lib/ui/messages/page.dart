import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/data/remote/message.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/messages/cubit.dart';
import 'package:openrent_client/ui/messages/state.dart';
import 'package:intl/intl.dart';

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
        appBar: AppBar(
          title: const Text('Messages'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              if (state.isLoading) const LinearProgressIndicator(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: state.list.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada percakapan. Ketik pesan untuk memulai.',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.list.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) =>
                              _Item(item: state.list[index]),
                        ),
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ControlledTextField<MessagesCubit, MessagesState>(
                        selector: (state) => state.currentMessage,
                        builder: (controller) => TextField(
                          controller: controller,
                          readOnly: !state.canEdit,
                          minLines: 1,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'Ketik pesan',
                            hintText: 'Tulis sesuatu...',
                            border: const OutlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: (message) => context
                              .read<MessagesCubit>()
                              .onCurrentMessageChanged(message),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: !state.canSubmit
                          ? null
                          : () => context.read<MessagesCubit>().onSend(),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(56, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final MessageResponseItem item;

  const _Item({super.key, required this.item});

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = item.currentUser
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.secondaryContainer;

    final textColor = item.currentUser
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.onTertiaryContainer;

    return Align(
      alignment: item.currentUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Stack(
          alignment: item.currentUser
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: item.currentUser ? 0 : 8,
                right: item.currentUser ? 8 : 0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(item.currentUser ? 18 : 0),
                  bottomRight: Radius.circular(item.currentUser ? 0 : 18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.message ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: textColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatTimestamp(item.createdAt),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: item.currentUser ? null : 0,
              right: item.currentUser ? 0 : null,
              child: CustomPaint(
                size: const Size(12, 16),
                painter: _MessageBubbleTailPainter(
                  color: bubbleColor,
                  isCurrentUser: item.currentUser,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubbleTailPainter extends CustomPainter {
  final Color color;
  final bool isCurrentUser;

  _MessageBubbleTailPainter({required this.color, required this.isCurrentUser});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    if (isCurrentUser) {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(0, size.height * 0.5, 0, 0);
    } else {
      path.moveTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.quadraticBezierTo(size.width, size.height * 0.5, size.width, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _MessageBubbleTailPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isCurrentUser != isCurrentUser;
  }
}
