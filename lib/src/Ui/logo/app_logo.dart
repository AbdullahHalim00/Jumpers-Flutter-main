import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../../Core/constants/strings/assets.dart';

class AppLogo extends StatelessWidget {
  /// called only
  final Widget _child;

  const AppLogo._(
    this._child, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  /// builds app logo with its release version
  factory AppLogo.versionBuilder({
    Key? key,
    String versionNum = "1.1.2",
    bool isDark = false,
  }) {
    return AppLogo._(
      _AppVersionBuilder(versionNum: versionNum, isDark: isDark),
      key: key,
    );
  }

  /// builds app logo light or black
  factory AppLogo.defaultLogo({
    double? height,
    double? width,
    double? scale,
    bool isBlack = false,
  }) {
    return AppLogo._(
      _AppDefaultLogo(
        scale: scale,
        width: width,
        height: height,
        isBlack: isBlack,
      ),
    );
  }
}

class _AppVersionBuilder extends StatelessWidget {
  final String versionNum;
  final bool isDark;

  const _AppVersionBuilder({
    Key? key,
    this.versionNum = "1.1.2",
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.0.ESH(),
        Image.asset(
          Assets.appLogo,
          height: 60.h,
          width: 90.w,
          scale: 3,
        ),
      ],
    );
  }
}

class _AppDefaultLogo extends StatelessWidget {
  final double? height;

  final double? width;

  final double? scale;
  final bool isBlack;

  const _AppDefaultLogo({
    Key? key,
    this.height,
    this.width,
    this.scale,
    this.isBlack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isBlack ? Assets.appLogo : Assets.appLogo,
      fit: BoxFit.contain,
      height: height,
      width: width,
      scale: scale,
    );
  }
}
