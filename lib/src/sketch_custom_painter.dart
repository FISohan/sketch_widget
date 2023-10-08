import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class SketchCustomPainter extends CustomPainter {
  SketchCustomPainter({required this.shader});
  final ui.FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height),
            width: 460,
            height: 460),
        Paint()..shader = shader);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
