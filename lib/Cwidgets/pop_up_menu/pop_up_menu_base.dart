import 'package:flutter/material.dart';

/// A reusable **3-dots menu button** with a dropdown.
/// Allows selecting an option from a list of menu items.
class WebDesCardMenuButton extends StatelessWidget {
  final Function(String)? onSelected;
  final List<PopupMenuEntry<String>> options;

  const WebDesCardMenuButton({
    super.key,
    required this.onSelected,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert_outlined,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => options,
    );
  }
}
