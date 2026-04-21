import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlledTextField<B extends StateStreamable<S>, S>
    extends StatefulWidget {
  final String Function(S) selector;
  final Widget Function(TextEditingController) builder;

  const ControlledTextField({super.key, required this.selector, required this.builder});

  @override
  State<ControlledTextField<B, S>> createState() =>
      _ControlledTextFieldState<B, S>();
}

class _ControlledTextFieldState<B extends StateStreamable<S>, S>
    extends State<ControlledTextField<B, S>> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.selector(context.read<B>().state);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listenWhen: (prev, curr) => controller.text != widget.selector(curr),
      listener: (context, state) {
        controller.text = widget.selector(state);
      },
      child: widget.builder(controller),
    );
  }
}
