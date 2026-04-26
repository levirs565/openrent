import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.style,
    this.loadingIndicator,
    this.height = 46,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final ButtonStyle? style;
  final Widget? loadingIndicator;
  final double height;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null && !isLoading;
    final ButtonStyle effectiveStyle = (style ?? const ButtonStyle()).merge(
      FilledButton.styleFrom(minimumSize: Size.fromHeight(height)),
    );

    return FilledButton(
      onPressed: enabled ? onPressed : null,
      style: effectiveStyle,
      child: SizedBox(
        height: height,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (widget, animation) {
            return FadeTransition(opacity: animation, child: widget);
          },
          child: isLoading
              ? Row(
                  key: const ValueKey('loading'),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child:
                          loadingIndicator ??
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                    const SizedBox(width: 12),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text('Memuat...'),
                    ),
                  ],
                )
              : Row(
                  key: const ValueKey('normal'),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [child],
                ),
        ),
      ),
    );
  }
}
