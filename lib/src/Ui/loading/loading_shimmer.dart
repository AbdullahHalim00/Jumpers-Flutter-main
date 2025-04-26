import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const _baseColor = Color(0xffE0E0E0);
const _baseDarkColor = Color(0xff242323);
const _highlightColor = Color(0xd7ffffff);
const _highlightDarkColor = Color(0xff767d7d);

class ShimmerBuilder extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const ShimmerBuilder({
    required this.child,
    this.isDark = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark ? _baseDarkColor : _baseColor,
      highlightColor: isDark ? _highlightDarkColor : _highlightColor,
      child: child,
    );
  }
}
