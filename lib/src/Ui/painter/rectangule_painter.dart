import 'package:flutter/material.dart';

class RectPainter extends CustomPainter {
  final Color? color;

  RectPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? const Color(0xffff4947).withOpacity(1.0);
    canvas.drawRRect(
      RRect.fromRectAndCorners(Rect.fromLTWH(0, 0, size.width, size.height),
          bottomRight: Radius.circular(size.width * 0.01166181),
          bottomLeft: Radius.circular(size.width * 0.01166181),
          topLeft: Radius.circular(size.width * 0.01166181),
          topRight: Radius.circular(size.width * 0.01166181)),
      paint0Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
