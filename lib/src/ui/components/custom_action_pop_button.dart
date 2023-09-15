import 'package:flutter/material.dart';

class PopAction extends StatelessWidget {
  const PopAction({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final icon = () {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return const BackButtonIcon();
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return const CloseButtonIcon();
      }
    }();

    final tooltip = () {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return MaterialLocalizations.of(context).backButtonTooltip;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return MaterialLocalizations.of(context).closeButtonTooltip;
      }
    }();
    return IconButton(
      icon: icon,
      tooltip: tooltip,
      onPressed: () {
        onPressed();
      },
    );
  }
}
