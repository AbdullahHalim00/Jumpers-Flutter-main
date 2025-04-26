import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Creates Horizontal Spaces (X-Axis SizedBox)
class XSpace {
  XSpace._();

  /// width : 2.5
  static SizedBox get tiny => SizedBox(
        width: 2.5.w,
      );

  /// width : 5.0
  static SizedBox get light => SizedBox(
        width: 5.w,
      );

  /// width : 10.0
  static SizedBox get normal => SizedBox(
        width: 10.w,
      );

  /// width : 15.0
  static SizedBox get hard => SizedBox(
        width: 15.w,
      );

  /// width : 20.0
  static SizedBox get extreme => SizedBox(
        width: 20.w,
      );

  /// width : 25.0
  static SizedBox get titan => SizedBox(
        width: 25.w,
      );
}

/// Creates Vertical Spaces (Y-Axis SizedBox)
class YSpace {
  YSpace._();

  /// height : 2.5
  static SizedBox get tiny => SizedBox(
        height: 2.5.h,
      );

  /// height : 5.0
  static SizedBox get light => SizedBox(
        height: 5.h,
      );

  /// height : 10.0
  static SizedBox get normal => SizedBox(
        height: 10.h,
      );

  /// height : 15.0
  static SizedBox get hard => SizedBox(
        height: 15.h,
      );

  /// height : 20.0
  static SizedBox get extreme => SizedBox(
        height: 20.h,
      );

  /// height : 25.0
  static SizedBox get titan => SizedBox(
        height: 25.h,
      );

  static SizedBox get erinYeager => SizedBox(
        height: 50.h,
      );

  /// creates a Spacer (free space) in the Columns between 2 children
  static Spacer get spacer => Spacer();
}
