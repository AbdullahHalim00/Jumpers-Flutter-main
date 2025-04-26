import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipperWidget extends StatelessWidget {
  final Widget child;

  const FlipperWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: child,
    );
  }
}
