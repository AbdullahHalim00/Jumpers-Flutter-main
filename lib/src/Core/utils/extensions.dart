import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSpaces on num {
  // ignore: non_constant_identifier_names
  SizedBox ESW() {
    return SizedBox(
      width: w,
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox ESH() {
    return SizedBox(
      height: h,
    );
  }
}

extension AssetUrl on String {
  // ignore: non_constant_identifier_names
  String get assetImg {
    return 'assets/images/${this}.png';
  }

  String get assetIcon {
    return 'assets/icons/${this}.png';
  }
}
