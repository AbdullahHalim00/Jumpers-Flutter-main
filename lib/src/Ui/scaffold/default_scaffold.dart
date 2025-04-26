import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../appbars/default_appbar.dart';
import '../text/custom_text.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;

  final bool? extendBodyBehindAppBar;
  final Color? scaffoldColor;
  final EdgeInsets? padding;

  final Color? appBarColor;
  final String? appBarTitle;
  final bool hideAppBar;
  final bool resizeToAvoidBottomInset;
  final AppBars? appBar;

  const DefaultScaffold({
    Key? key,
    required this.body,
    this.appBarTitle,
    this.extendBodyBehindAppBar,
    this.appBarColor,
    this.scaffoldColor,
    this.hideAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.appBar,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      backgroundColor: scaffoldColor ?? AppColors.scafBCGBasic,
      appBar: !hideAppBar
          ? (appBar ??
              AppBar(
                backgroundColor: appBarColor ?? (AppColors.scafBCGBasic),
                title: CustomText(
                  appBarTitle ?? "",
                ),
              ))
          : null,
      body: SafeArea(
        child: Padding(
          padding: padding ?? AppInsets.defaultScreenALL,
          child: body,
        ),
      ),
    );
  }
}
