import 'package:flutter/material.dart';

class CustomColumn extends Column {
  final double space;
  final List<Widget> childrens;
  CustomColumn({
    super.key,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.textBaseline,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    required this.childrens,
    required this.space,
  }) : super(children: _build(childrens, space));

  static List<Widget> _build(List<Widget> children, double space) {
    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: space));
      }
    }
    return children;
  }
}

class CustomColumns extends Column {
  CustomColumns({
    super.key,
    required List<Widget> children,
    double spacing = 0.0,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
          children: _addSpacing(children, spacing),
        );

  // Function to add spacing between children
  static List<Widget> _addSpacing(List<Widget> children, double spacing) {
    if (spacing <= 0.0) {
      return children;
    }

    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }
    return spacedChildren;
  }
}
