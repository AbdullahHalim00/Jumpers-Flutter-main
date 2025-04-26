import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInsets {
  AppInsets._();

  static const double _defaultScreenPadding = 16.0;

  static EdgeInsets defaultScreenALL = EdgeInsets.all(_defaultScreenPadding.h);
  static EdgeInsets defaultScreenHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultScreenPadding.w);
  static EdgeInsets defaultScreenVertical =
      EdgeInsets.symmetric(vertical: _defaultScreenPadding.h);
}
