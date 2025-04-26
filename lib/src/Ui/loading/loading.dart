import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/decorations/app_sizes.dart';
import '../builders/conditional_builder.dart';

/// Depends on loading_animation_widget  and flutter_spinkit Packages
class Loading extends StatelessWidget {
  final Widget? _customLoadingWidget;
  final bool isCentered;
  final Color? backgroundColor;

  const Loading._(
    this._customLoadingWidget, {
    Key? key,
    this.isCentered = true,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isCentered,
      onBuild: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Center(
          child: _customLoadingWidget,
        ),
      ),
      onFeedBack: CircleAvatar(
        backgroundColor: backgroundColor,
        child: _customLoadingWidget,
      ),
    );
  }

  factory Loading.hourGlass({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitHourGlass(
        color: color,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.wanderingCubes({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitWanderingCubes(
        color: color,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.pouringHourGlass({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    double strokeWidth = 1,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitPouringHourGlass(
        color: color,
        size: size,
        duration: Duration(seconds: durationSeconds),
        strokeWidth: strokeWidth,
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.fadingCircle({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitFadingCircle(
        color: color,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.pulse({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius * 2,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      Stack(
        alignment: Alignment.center,
        children: [
          SpinKitPulse(
            color: color,
            duration: Duration(seconds: durationSeconds),
            size: size,
          ),
          const CircleAvatar(
            backgroundColor: AppColors.mainSecBCGLight,
            radius: 8,
          ),
        ],
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  ///  ---------------------- loading_animation_widget --------------------------

  factory Loading.beat({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.beat(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.bouncingBall({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.bouncingBall(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.discreteCircle({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.discreteCircle(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.stretchedDots({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.stretchedDots(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.hexagonDots({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius * 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.hexagonDots(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.twoRotatingArc({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.twoRotatingArc(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.fourRotatingDots({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.fourRotatingDots(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.staggeredDotsWave({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.staggeredDotsWave(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.inkDrop({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.inkDrop(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.threeRotatingDots({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.threeRotatingDots(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.waveDots({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.waveDots(color: color, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  /// ------------------ APP ------------------
  factory Loading.caseLoading({
    Color color = AppColors.loaderColor,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LottieBuilder.asset(Assets.lottie_loader_case),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }
}
