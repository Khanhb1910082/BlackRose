import 'package:flutter/material.dart';

class ParallelogramBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    // Path path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(size.width * 1, 0)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width * 0.3, size.height)
    //   ..lineTo(0, 0);
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 40, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(40, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
