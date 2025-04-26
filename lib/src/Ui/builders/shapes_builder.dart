import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/painter/dashed_square_painter.dart';
import 'package:jumper/src/Ui/painter/rectangule_painter.dart';

import '../painter/dashed_line_painter.dart';

class ShapeBuilder extends StatelessWidget {
  final Widget _child;

  const ShapeBuilder._(this._child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  factory ShapeBuilder.dashLine({
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    return ShapeBuilder._(
      _BuildDashLine(
        key: key,
        margin: margin,
        padding: padding,
      ),
    );
  }

  factory ShapeBuilder.dashSquare({
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color color = Colors.black,
    double strokeWidth = 1.0,
    double gap = 5.0,
    Widget? child,
  }) {
    return ShapeBuilder._(_BuildDashedSquare(
      key: key,
      margin: margin,
      padding: padding,
      color: color,
      child: child,
      gap: gap,
      strokeWidth: strokeWidth,
    ));
  }

  factory ShapeBuilder.rect({
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color color = AppColors.redOverlay,
    double? height,
    double width = double.infinity,
    Widget? child,
  }) {
    return ShapeBuilder._(_BuildRect(
      key: key,
      margin: margin,
      padding: padding,
      color: color,
      width: width,
      height: height,
    ));
  }
}

class _BuildDashLine extends StatelessWidget {
  final EdgeInsets? padding;

  final EdgeInsets? margin;

  const _BuildDashLine({
    Key? key,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: CustomPaint(
        painter: DashedLinePainter(),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.01),
      ),
    );
  }
}

class _BuildDashedSquare extends StatelessWidget {
  final EdgeInsets? padding;

  final EdgeInsets? margin;
  final Color color;
  final double strokeWidth;
  final double gap;
  final Widget? child;

  const _BuildDashedSquare({
    Key? key,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
    this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.all(strokeWidth / 2),
      child: CustomPaint(
        painter:
            DashRectPainter(color: color, strokeWidth: strokeWidth, gap: gap),
        child: child,
      ),
    );
  }
}

class _BuildRect extends StatelessWidget {
  final EdgeInsets? padding;

  final EdgeInsets? margin;
  final Color? color;
  final double? height;

  final double width;

  const _BuildRect({
    Key? key,
    this.padding,
    this.margin,
    this.color = AppColors.redOverlay,
    this.height,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: CustomPaint(
        size: Size(width, height ?? (width * 0.11661807580174927).toDouble()),
        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RectPainter(
          color: color,
        ),
      ),
    );
  }
}
