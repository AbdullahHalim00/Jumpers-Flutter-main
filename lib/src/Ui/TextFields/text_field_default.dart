import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

enum FieldType {
  withBorder,
  withOutBorder,
}

enum SecureType {
  never,
  toggle,
  always,
}

class TextFieldDefault extends StatefulWidget {
  final String hint;
  final String? label;
  final String upperTitle;
  final FieldType fieldType;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? suffixText;
  final IconData? icon;
  final String? prefixIconUrl;
  final String? suffixIconUrl;
  final bool? isPrefixIcon;
  final bool? isSuffixIcon;

  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final VoidCallback? onComplete;
  final FormFieldSetter<String>? onSaved;
  final Color hintColor;
  final Color? labelColor;
  final Color errorColor;
  final Color fieldColor;
  final Color filledColor;
  final Color enableBorder;
  final Color disableBorder;
  final Color focusBorder;
  final Color errorBorder;
  final Color errorBcgColor;
  final Color cursorColor;
  final Color prefixColor;
  final Color suffixColor;
  final Color iconColor;

  final String? errorText;
  final String? errorLargeText;
  final String? errorMinimumText;
  final int largeCondition;
  final int minimumCondition;
  final int maxLines;

  final TextEditingController? controller;

  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;

  final double borderRadius;
  final double borderWidth;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final SecureType secureType;

  final double outerHorizontalPadding;

  final bool enable;
  final bool isRequired;
  final bool readOnly;
  final int? maxLength;

  final Color upperTitleColor;

  const TextFieldDefault({
    Key? key,
    this.hint = '',
    this.controller,
    this.upperTitle = '',
    this.upperTitleColor = AppColors.kCTFUpperTitle,
    this.label,
    this.fieldType = FieldType.withBorder,
    this.prefixIconData,
    this.suffixIconData,
    this.prefixIconUrl,
    this.suffixIconUrl,
    this.isPrefixIcon = true,
    this.isSuffixIcon = false,
    this.validation,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onComplete,
    this.onSaved,
    this.maxLines = 1,
    this.enable = true,
    this.hintColor = AppColors.kCTFHintTitle,
    this.labelColor = AppColors.kCTFHintTitle,
    this.errorColor = AppColors.kCTFErrorText,
    this.fieldColor = AppColors.kCTFBackGround,
    this.filledColor = AppColors.kCTFBackGround,
    this.enableBorder = AppColors.kCTFEnableBorder,
    this.disableBorder = AppColors.kCTFDisableBorder,
    this.focusBorder = AppColors.kCTFFocusBorder,
    this.errorBorder = AppColors.kCTFErrorBorder,
    this.errorBcgColor = AppColors.kCTFErrorTextBcg,
    this.cursorColor = AppColors.kCTFCursor,
    this.errorText,
    this.errorLargeText,
    this.largeCondition = 0,
    this.minimumCondition = 0,
    this.errorMinimumText,
    this.horizontalPadding = 19.0,
    this.verticalPadding = 14.0,
    this.icon,
    this.onSuffixTap,
    this.prefixColor = AppColors.kCTFPreFixIcon,
    this.suffixColor = AppColors.kCTFSuffixFixIcon,
    this.iconColor = AppColors.kCTFPreFixIcon,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.keyboardType,
    this.textInputAction,
    this.secureType = SecureType.never,
    this.outerHorizontalPadding = 0.0,
    this.isRequired = false,
    this.readOnly = false,
    this.suffixText,
  }) : super(key: key);

  @override
  TextFieldDefaultState createState() => TextFieldDefaultState();
}

class TextFieldDefaultState extends State<TextFieldDefault> {
  bool secureState = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: widget.outerHorizontalPadding.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawUpperTitle(
                  upperTitleText: widget.upperTitle,
                  usedUpperTitleColor: widget.upperTitleColor),
              Builder(builder: (context) {
                return TextFormField(
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  obscureText: widget.secureType == SecureType.never
                      ? false
                      : widget.secureType == SecureType.always
                          ? true
                          : secureState,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  onEditingComplete: widget.onComplete,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                  controller: widget.controller,
                  cursorColor: widget.cursorColor,
                  // ignore: missing_return
                  enabled: widget.enable,
                  maxLines: widget.maxLines,
                  maxLength: widget.maxLength,
                  validator: widget.validation ??
                      (value) {
                        if (value!.isEmpty) {
                          return widget.errorText;
                        } else if (value.length < widget.minimumCondition) {
                          return widget.errorMinimumText;
                        }
                        if (widget.largeCondition != 0) {
                          if (value.length > widget.largeCondition) {
                            return widget.errorLargeText;
                          }
                        } else {
                          return null;
                        }
                        return null;
                      },
                  style: TextStyle(
                      fontSize: 16.r,
                      color: AppColors.kCTFMainTitle,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    // prefixText:widget.isRequired? "*":null,
                    // prefixStyle:TextStyle(
                    //   color: AppColors.red,
                    //   fontSize: 15.r,
                    // ),
                    fillColor: widget.filledColor,
                    // HINT TEXT WITH STYLE
                    // hintText: widget.hint,
                    hintText: widget.isRequired
                        ? "${widget.hint.tr} ${"*"}"
                        : widget.hint.tr,
                    // hintText: widget.hint.tr,

                    hintStyle: TextStyle(
                      fontSize: 15.r,
                      color: widget.hintColor,
                      fontWeight: FontWeight.w300,
                    ),
                    // LABEL TEXT WITH STYLE
                    labelText: widget.label,

                    labelStyle: TextStyle(
                      fontSize: 11.r,
                      color: widget.labelColor,
                      fontWeight: FontWeight.w300,
                    ),
                    // ERROR TEXT STYLE
                    errorStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 12.r,
                              color: widget.errorColor,
                              fontWeight: FontWeight.w300,
                              backgroundColor: widget.errorBcgColor,
                            ),
                    // PADDING
                    contentPadding: EdgeInsets.symmetric(
                      vertical: widget.verticalPadding.h,
                      horizontal: widget.horizontalPadding.w,
                    ),

                    icon: widget.icon != null
                        ? Icon(
                            widget.icon,
                            color: widget.iconColor,
                            size: 24.w,
                          )
                        : null,
                    prefixIcon: (widget.prefixIconUrl != null ||
                            widget.prefixIconData != null)
                        ? widget.prefixIconUrl != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "${widget.prefixIconUrl}",
                                    height: 16.w,
                                    // width: 12.17.w,
                                    color: widget.prefixColor,
                                  ),
                                ],
                              )
                            : Icon(
                                widget.prefixIconData,
                                color: widget.prefixColor,
                                size: 24.w,
                              )
                        : null,
                    prefixIconConstraints: widget.prefixIconUrl == null
                        ? null
                        : BoxConstraints(
                            maxHeight: 16.w,
                            maxWidth: (12.17 + (25.0 * 1.0)).w,
                          ),
                    suffixText: widget.suffixText,
                    suffixIcon: widget.secureType == SecureType.toggle
                        ? IconButton(
                            icon: Icon(secureState
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            color: widget.suffixColor,
                            iconSize: 20.w,
                            onPressed: () {
                              setState(() {
                                secureState = !secureState;
                              });
                            })
                        : (widget.suffixIconData != null ||
                                widget.suffixIconUrl != null)
                            ? IconButton(
                                icon: Icon(
                                  widget.suffixIconData,
                                  color: widget.suffixColor,
                                  size: 24.w,
                                ),
                                onPressed: widget.onSuffixTap,
                              )
                            : null,
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: (12.17 + (25.0 * 1.0)).w,
                    ),
                    border: widget.fieldType == FieldType.withBorder
                        ? OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius.r),
                            borderSide: BorderSide(
                                color: widget.enableBorder,
                                width: widget.borderWidth.w
                                //style: BorderStyle.solid,
                                ),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.errorBorder,
                                width: widget.borderWidth.w),
                          ),
                    disabledBorder: widget.fieldType == FieldType.withBorder
                        ? OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius.r),
                            borderSide: BorderSide(
                                color: widget.disableBorder,
                                width: widget.borderWidth.w),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.disableBorder,
                                width: widget.borderWidth.w),
                          ),
                    enabledBorder: widget.fieldType == FieldType.withBorder
                        ? OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius.r),
                            borderSide: BorderSide(
                                color: widget.enableBorder,
                                width: widget.borderWidth.w),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.enableBorder,
                                width: widget.borderWidth.w),
                          ),
                    focusedBorder: widget.fieldType == FieldType.withBorder
                        ? OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius.r),
                            borderSide: BorderSide(
                                color: widget.focusBorder,
                                width: widget.borderWidth.w),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.focusBorder,
                                width: widget.borderWidth.w),
                          ),
                    errorBorder: widget.fieldType == FieldType.withBorder
                        ? OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius.r),
                            borderSide: BorderSide(
                                color: widget.errorBorder,
                                width: widget.borderWidth.w),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.errorBorder,
                              width: widget.borderWidth.w,
                            ),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
        if (widget.isRequired)
          CustomText(
            "*",
            color: AppColors.red,
            padding: EdgeInsetsDirectional.only(
              start: widget.prefixIconUrl != null ? 30.0.w : 16.w,
              bottom: 16.h,

              /// for now
              // bottom: widget.errorText != null ? 40.h : 0,
            ),
          )
      ],
    );
  }

  Widget drawUpperTitle(
      {String upperTitleText = '', Color? usedUpperTitleColor}) {
    return widget.upperTitle.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(bottom: 7.h),
            child: Text(
              widget.upperTitle,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: usedUpperTitleColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          )
        : const SizedBox(
            height: 0,
          );
  }
}
