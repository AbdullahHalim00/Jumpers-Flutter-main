import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/arabic_num_extension.dart';

enum FW {
  bold,
  semiBold,
  normal,
  medium,
  regular,
  light,
  extraLight,
}

enum CustomTextDecoration {
  none,
  lineThrough,
  underLine,
  overLine,
  // combine,
}

class CustomText extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final double? letterSpacing;
  final bool isBold;
  final bool textShadow;
  final bool isUpperCase;
  final EdgeInsetsGeometry? padding;
  final bool isOverFlow;
  final int? maxLines;
  final double? textHeight;
  final CustomTextDecoration decoration;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FW fontWeight;

  const CustomText(
    this.label, {
    Key? key,
    this.color = AppColors.titleBlack,
    this.fontSize = 16,
    this.fontWeight = FW.regular,
    this.isBold = false,
    this.isOverFlow = false,
    this.isUpperCase = false,
    this.padding,
    this.maxLines,
    this.decoration = CustomTextDecoration.none,
    this.textHeight,
    this.fontFamily,
    this.textAlign,
    this.textShadow = false,
    this.backgroundColor,
    this.letterSpacing,
  }) : super(key: key);

  /// Build Subtitle Text

  factory CustomText.subtitle(
    String label, {
    Key? key,
    Color color = AppColors.greyPrimary,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    double fontSize = 12.0,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
    FW fontWeight = FW.medium,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        backgroundColor: backgroundColor,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  factory CustomText.light(
    String label, {
    Key? key,
    Color color = AppColors.greyPrimary,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    double fontSize = 12.0,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
    FW fontWeight = FW.light,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        backgroundColor: backgroundColor,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  /// Build Header Text

  factory CustomText.header(
    String label, {
    Key? key,
    double fontSize = 14.0,
    FW fontWeight = FW.medium,
    Color color = AppColors.black,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        (isUpperCase ? label.toUpperCase().tr.adN : label.tr.adN)
            .replaceAll("_", " "),

        /// adaptive arabic nums ///TODO/ update when eng sub ends
        textScaleFactor: 1,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: color,
              backgroundColor: backgroundColor,
              fontSize: (fontSize ?? 16),
              fontWeight: isBold ? _getFw(FW.bold) : _getFw(fontWeight),
              decoration: _getTextDecoration(decoration),
              //TextDecoration.combine(decorations),
              height: textHeight,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily ?? fontFamily,
              shadows: textShadow
                  ? [
                      const Shadow(
                        blurRadius: 0.8,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      )
                    ]
                  : null,
            ),
        textAlign: textAlign,
        overflow: isOverFlow ? TextOverflow.ellipsis : null,
        maxLines: maxLines,
      ),
    );
  }
}

FontWeight _getFw(FW fw) {
  FontWeight fontWeight;
  switch (fw) {
    case FW.bold:
      fontWeight = FontWeight.bold;
      break;
    case FW.semiBold:
      fontWeight = FontWeight.w600;
      break;
    case FW.normal:
      fontWeight = FontWeight.normal;
      break;
    case FW.medium:
      fontWeight = FontWeight.w500;
      break;
    case FW.regular:
      fontWeight = FontWeight.w400;
      break;
    case FW.light:
      fontWeight = FontWeight.w300;
      break;
    case FW.extraLight:
      fontWeight = FontWeight.w200;
      break;
  }
  return fontWeight;
}

TextDecoration _getTextDecoration(CustomTextDecoration decoration) {
  switch (decoration) {
    case CustomTextDecoration.none:
      return TextDecoration.none;
    case CustomTextDecoration.lineThrough:
      return TextDecoration.lineThrough;
    case CustomTextDecoration.underLine:
      return TextDecoration.underline;
    case CustomTextDecoration.overLine:
      return TextDecoration.overline;
    // case CustomTextDecoration.combine:
    //   return TextDecoration.combine([
    //     TextDecoration.none,
    //   ]);
  }
}

class CustomRText extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final bool isBold;
  final bool textShadow;
  final bool isUpperCase;
  final EdgeInsetsGeometry? padding;
  final bool isOverFlow;
  final int? maxLines;
  final double? textHeight;
  final CustomTextDecoration decoration;
  final String? fontFamily;
  final TextAlign textAlign;
  final FW fontWeight;

  const CustomRText(
    this.label, {
    Key? key,
    this.color = AppColors.titleBlack,
    this.fontSize = 14,
    this.fontWeight = FW.regular,
    this.isBold = false,
    this.isOverFlow = false,
    this.isUpperCase = false,
    this.padding,
    this.maxLines,
    this.decoration = CustomTextDecoration.none,
    this.textHeight,
    this.fontFamily,
    this.textAlign = TextAlign.center,
    this.textShadow = false,
    this.backgroundColor,
  }) : super(key: key);

  /// Build Subtitle Text

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: RichText(
        textAlign: textAlign,
        overflow: isOverFlow ? TextOverflow.ellipsis : TextOverflow.clip,
        maxLines: maxLines,
        text: TextSpan(
          text: isUpperCase ? label.toUpperCase().tr : label.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: color,
                backgroundColor: backgroundColor,
                fontSize: (fontSize ?? 16),
                fontWeight: isBold ? _getFw(FW.bold) : _getFw(fontWeight),
                decoration: _getTextDecoration(decoration),
                //TextDecoration.combine(decorations),
                height: textHeight,
                fontFamily: fontFamily ?? fontFamily,
                shadows: textShadow
                    ? [
                        const Shadow(
                          blurRadius: 0.8,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        )
                      ]
                    : null,
              ),
          children: [
            const TextSpan(text: ' '),
            TextSpan(
              text: '*',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.red,
                    backgroundColor: backgroundColor,
                    fontSize: (fontSize ?? 16),
                    fontWeight: isBold ? _getFw(FW.bold) : _getFw(fontWeight),
                    decoration: _getTextDecoration(decoration),
                    //TextDecoration.combine(decorations),
                    height: textHeight,

                    fontFamily: fontFamily ?? fontFamily,
                    shadows: textShadow
                        ? [
                            const Shadow(
                              blurRadius: 0.8,
                              color: Colors.black,
                              offset: Offset(1, 1),
                            )
                          ]
                        : null,
                  ),
            ),
          ],
        ),
      ),
      // Text(
      //   isUpperCase ? label.toUpperCase().tr : label.tr,
      //   textScaleFactor: 1,
      //   style: Theme.of(context).textTheme.bodyText2?.copyWith(
      //     color: color,
      //     backgroundColor: backgroundColor,
      //     fontSize: (fontSize ?? 16).sp,
      //     fontWeight: isBold ? _getFw(FW.bold) : _getFw(fontWeight),
      //     decoration: _getTextDecoration(decoration),
      //     //TextDecoration.combine(decorations),
      //     height: textHeight,
      //
      //     fontFamily: fontFamily ?? fontFamily,
      //     shadows: textShadow
      //         ? [
      //       const Shadow(
      //         blurRadius: 0.8,
      //         color: Colors.black,
      //         offset: Offset(1, 1),
      //       )
      //     ]
      //         : null,
      //   ),
      //   textAlign: textAlign,
      //   overflow: isOverFlow ? TextOverflow.ellipsis : null,
      //   maxLines: maxLines,
      // ),
    );
  }
}
