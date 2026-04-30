import 'dart:math';
import 'package:flutter/material.dart';

class PerspectiveRoadPainter extends CustomPainter {
  final double timeElapsed;
  final int selectedDuration;
  final double feetY;

  PerspectiveRoadPainter({
    required this.timeElapsed,
    required this.selectedDuration,
    required this.feetY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double horizonY = 0.0;

    Paint grassPaint = Paint()..color = const Color(0xFF1B5E20);
    canvas.drawRect(
      Rect.fromLTWH(0, horizonY, size.width, size.height - horizonY),
      grassPaint,
    );

    Path roadPath = Path();
    roadPath.moveTo(size.width * 0.45, horizonY);
    roadPath.lineTo(size.width * 0.55, horizonY);
    roadPath.lineTo(size.width * 0.95, size.height);
    roadPath.lineTo(size.width * 0.05, size.height);
    roadPath.close();
    canvas.drawPath(roadPath, Paint()..color = const Color(0xFF303030));

    Paint dashPaint = Paint()..color = Colors.yellow[700]!;
    for (int i = 0; i < 5; i++) {
      double p = ((timeElapsed * 1.5) + i / 5) % 1.0;
      double z = p * p;
      double y = horizonY + (size.height - horizonY) * z;

      canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width / 2, y + (5 + 60 * z) / 2),
          width: 2 + 15 * z,
          height: 5 + 60 * z,
        ),
        dashPaint,
      );
    }

    double charZ_squared = (feetY - horizonY) / (size.height - horizonY);
    double charZ = sqrt(charZ_squared);
    double speedZ = 0.3;

    double startZ = charZ + (timeElapsed * speedZ);
    if (startZ >= 0.0 && startZ <= 1.0) {
      _drawCrossLine(
        canvas,
        size,
        horizonY,
        startZ,
        Colors.white,
        "S T A R T",
        Colors.black,
      );
    }

    double finishZ = charZ - ((selectedDuration - timeElapsed) * speedZ);
    if (finishZ >= 0.0 && finishZ <= 1.0) {
      _drawCrossLine(
        canvas,
        size,
        horizonY,
        finishZ,
        Colors.redAccent,
        "F I N I S H",
        Colors.white,
      );
    }
  }

  void _drawCrossLine(
    Canvas canvas,
    Size size,
    double horizonY,
    double zTop,
    Color bgColor,
    String text,
    Color textColor,
  ) {
    double yZ_top = zTop * zTop;
    double yTop = horizonY + (size.height - horizonY) * yZ_top;

    double zBottom = zTop + 0.06;
    double yZ_bottom = zBottom * zBottom;
    double yBottom = horizonY + (size.height - horizonY) * yZ_bottom;

    double leftTopX = size.width * (0.45 - 0.40 * yZ_top);
    double rightTopX = size.width * (0.55 + 0.40 * yZ_top);
    double leftBottomX = size.width * (0.45 - 0.40 * yZ_bottom);
    double rightBottomX = size.width * (0.55 + 0.40 * yZ_bottom);

    Path polyPath = Path()
      ..moveTo(leftTopX, yTop)
      ..lineTo(rightTopX, yTop)
      ..lineTo(rightBottomX, yBottom)
      ..lineTo(leftBottomX, yBottom)
      ..close();

    canvas.drawPath(polyPath, Paint()..color = bgColor);

    double midY = (yTop + yBottom) / 2;
    double roadWidth = rightTopX - leftTopX;

    double dynamicFontSize = max(1.0, roadWidth * 0.15);
    double dynamicLetterSpacing = roadWidth * 0.02;

    TextSpan span = TextSpan(
      style: TextStyle(
        color: textColor,
        fontSize: dynamicFontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: dynamicLetterSpacing,
      ),
      text: text,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    tp.paint(
      canvas,
      Offset((leftTopX + rightTopX) / 2 - tp.width / 2, midY - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
