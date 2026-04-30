import 'package:flutter/material.dart';

class StickmanCarrierPainter extends CustomPainter {
  final double walkValue;
  StickmanCarrierPainter(this.walkValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    double midX = size.width / 2;
    canvas.drawCircle(Offset(midX, 15), 15, paint);
    canvas.drawLine(Offset(midX, 30), Offset(midX, 70), paint);
    canvas.drawLine(Offset(midX, 40), Offset(midX - 30, 0), paint);
    canvas.drawLine(Offset(midX, 40), Offset(midX + 30, 0), paint);

    double swing = (walkValue - 0.5) * 2;
    canvas.drawLine(Offset(midX, 70), Offset(midX - 25 * swing, 120), paint);
    canvas.drawLine(Offset(midX, 70), Offset(midX + 25 * swing, 120), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
