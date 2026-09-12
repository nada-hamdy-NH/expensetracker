import 'package:flutter/material.dart';

/// The brand mark: a rounded badge with a single flowing ribbon cut through
/// it — stands in for a logo asset until a real one exists.
class FlowMark extends StatelessWidget {
  const FlowMark({super.key, this.size = 72});

  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _FlowMarkPainter(
          badgeColor: scheme.primary,
          ribbonColor: scheme.onPrimary,
        ),
      ),
    );
  }
}

class _FlowMarkPainter extends CustomPainter {
  _FlowMarkPainter({required this.badgeColor, required this.ribbonColor});

  final Color badgeColor;
  final Color ribbonColor;

  @override
  void paint(Canvas canvas, Size size) {
    final badgeRadius = size.width * 0.28;
    final badgeRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final badgePaint = Paint()..color = badgeColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(badgeRect, Radius.circular(badgeRadius)),
      badgePaint,
    );

    final w = size.width;
    final h = size.height;
    final ribbon = Path()
      ..moveTo(w * 0.22, h * 0.36)
      ..cubicTo(w * 0.40, h * 0.20, w * 0.60, h * 0.52, w * 0.78, h * 0.36)
      ..moveTo(w * 0.22, h * 0.64)
      ..cubicTo(w * 0.40, h * 0.48, w * 0.60, h * 0.80, w * 0.78, h * 0.64);

    final ribbonPaint = Paint()
      ..color = ribbonColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.075
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(ribbon, ribbonPaint);
  }

  @override
  bool shouldRepaint(covariant _FlowMarkPainter oldDelegate) {
    return oldDelegate.badgeColor != badgeColor ||
        oldDelegate.ribbonColor != ribbonColor;
  }
}
