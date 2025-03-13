import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final Color color;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.borderRadius = 8.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderRadius: borderRadius,
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final Color color;

  DashedBorderPainter({
    required this.dashWidth,
    required this.dashSpace,
    required this.borderRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(borderRadius),
          ),
        );

    final dashPath = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final segmentLength = dashWidth + dashSpace;
        final end = distance + dashWidth;

        dashPath.addPath(
          metric.extractPath(distance, end.clamp(0.0, metric.length)),
          Offset.zero,
        );

        distance += segmentLength;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
