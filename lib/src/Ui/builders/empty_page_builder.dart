import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';

import '../../Core/constants/strings/assets.dart';
import '../buttons/redirection_button.dart';
import '../text/custom_text.dart';

class EmptyPageBuilder extends StatelessWidget {
  final String? title;
  final String? body;
  final String? redirectLabel;
  final String imageUrl;
  final String redirectImageUrl;
  final VoidCallback? onRedirect;
  final Widget? customButton;
  final bool reverseRedirectChildrenOrder;
  final bool showRedirectIcon;

  const EmptyPageBuilder({
    Key? key,
    this.title,
    this.body,
    this.redirectLabel,
    required this.imageUrl,
    this.redirectImageUrl = Assets.reload,
    this.onRedirect,
    this.showRedirectIcon = true,
    this.customButton,
    this.reverseRedirectChildrenOrder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          height: 130.h,
          width: 150.w,
          fit: BoxFit.cover,
          scale: 4,
        ),
        20.8.ESH(),
        if (title != null) ...[
          CustomText(
            "$title",
            fontWeight: FW.semiBold,
            fontSize: 16,
          ),
          16.0.ESH(),
        ],
        if (body != null)
          CustomText.subtitle(
            "$body",
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            fontSize: 13,
            fontWeight: FW.light,
            textAlign: TextAlign.center,
          ),
        // if (onRedirect != null) ...[
        //   16.0.ESH(),
        //   RedirectionButton(
        //     showIcon: showRedirectIcon,
        //     padding: const EdgeInsets.symmetric(horizontal: 90.0),
        //     label: redirectLabel ?? "retry".tr,
        //     imageUrl: redirectImageUrl,
        //     onPressed: onRedirect,
        //   ),
        // ],
        if (customButton != null || onRedirect != null)
          ConditionalBuilder(
            condition: customButton != null,
            onBuild: customButton ?? const SizedBox(),
            onFeedBack: onRedirect != null
                ? Column(
                    children: [
                      16.0.ESH(),
                      RedirectionButton(
                        reverseOrder: reverseRedirectChildrenOrder,
                        showIcon: showRedirectIcon,
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
                        label: redirectLabel ?? "retry".tr,
                        imageUrl: redirectImageUrl,
                        onPressed: onRedirect,
                      ),
                    ],
                  )
                : null,
          ),
      ],
    );
  }
}
// Widget build(BuildContext context) {
//   return DefaultScaffold(
//     scaffoldColor: AppColors.scafBCGBasic,
//     extendBodyBehindAppBar: (appBarTitle != null) ? false : true,
//     appBarColor: (appBarTitle != null) ? null : Colors.transparent,
//     appBarTitle: appBarTitle,
//     hideAppBar: hideAppBar,
//     body: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           imageUrl,
//           height: 140.h,
//           width: 150.w,
//           // scale: 4,
//         ),
//         // CustomIconAvatar(
//         //   imageUrl: imageUrl,
//         //   radius: MediaQuery.of(context).size.height * 0.2,
//         // ),
//         25.8.ESH(),
//
//         Column(
//           children: [
//             CustomText(
//               title,
//              fontWeight: FW.bold,
//               fontSize: 18,
//             ),
//             16.0.ESH(),
//          if (body!=null)   CustomText.subtitle(
//               "$body"  ,
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               fontSize: 13,
//               fontWeight: FW.light,
//               textAlign: TextAlign.center,
//             ),
//             YSpace.hard,
//             RedirectionButton(
//               showIcon: showRedirectIcon,
//               padding: const EdgeInsets.symmetric(horizontal: 90.0),
//               label: redirectLabel ?? "retry".tr,
//               imageUrl: redirectImageUrl,
//               onPressed: onRedirect,
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
