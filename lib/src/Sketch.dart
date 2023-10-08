import 'dart:developer';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:sketch_widget/src/sketch_custom_painter.dart';

class Sketch extends StatefulWidget {
  final Widget child;
  const Sketch({super.key, required this.child});

  @override
  State<Sketch> createState() => _SketchState();
}

class _SketchState extends State<Sketch> {
  FragmentShader? shader;

  @override
  void initState() {
    super.initState();
    log("-----------------------");
  }

  Future<FragmentShader> loadShader() async {
    FragmentProgram program =
        await FragmentProgram.fromAsset('packages/sketch_widget/shaders/sketch.frag');
        log("-----------------------");
    return program.fragmentShader();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: loadShader(),
          builder: (context, snapshot) => snapshot.data == null ? Text("${snapshot.error}") : CustomPaint(
              foregroundPainter: SketchCustomPainter(shader: snapshot.data!),
              child: widget.child,
            ),
        );
  }
}
