import 'package:flutter/material.dart';

/// A widget that displays a horizontal dashed line.
///
/// The [DashedDivider] widget is a customizable divider that draws a dashed
/// line across its width. It allows customization of the dash height, width,
/// and color through its properties.
///
/// The [height] parameter specifies the thickness of the dashed line, with a
/// default value of 1.0. The [dashWidth] parameter determines the width of
/// each dash, defaulting to 5.0. The [color] parameter sets the color of the
/// dashes, defaulting to black.
///
/// This widget uses a [_DashedLinePainter] to render the dashed line.

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const DashedDivider({
    super.key,
    this.height = 1.0,
    this.dashWidth = 5.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DashedLinePainter(dashWidth: dashWidth, color: color),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final Color color;

  _DashedLinePainter({required this.dashWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = size.height;

    double startX = 15.0; // Starting position for the dashes
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth * 2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
