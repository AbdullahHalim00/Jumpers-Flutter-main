import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Bloc/models/pop_up_model.dart';
import '../../Core/constants/colors/app_colors.dart';
import '../builders/conditional_builder.dart';
import '../text/custom_text.dart';

class DefaultPopUpButton extends StatelessWidget {
  final List<PopUpModel> popUps;
  final PopUpMenuStyle menuStyle;
  final bool hasBCG;
  final BorderRadiusGeometry? borderRadius;

  const DefaultPopUpButton({
    Key? key,
    required this.popUps,
    this.menuStyle = PopUpMenuStyle.vertical,
    this.hasBCG = true,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      enableFeedback: true,
      onSelected: null,
      // (String v)=>
      //   popUps.firstWhere((pop) => pop.label == v)
      //     .onSelected!(),
      onCanceled: null,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topRight: Radius.circular(20.0),

              // bottomLeft: Radius.circular(20.0),
            ),
      ),

      icon: hasBCG
          ? CircleAvatar(
              backgroundColor: AppColors.mainOverlay,
              child: _defaultIcon(menuStyle),
            )
          : _defaultIcon(menuStyle),
      // color: Colors.green,

      itemBuilder: (BuildContext context) {
        return popUps
            .map(
              (e) => PopupMenuItem<String>(
                enabled: false,
                // onTap: (){
                //   e.onSelected!();
                // },
                // onTap:(){
                //   printDM("tap hena ahooooooooo");
                //   e.onSelected!();
                //   printDM("tap hena ahooooooooo 2");
                // },
                // e.onSelected ??

                child: SizedBox(
                  height: 50.h,
                  // color: Colors.orange,
                  child: GestureDetector(
                    onTap: () {
                      e.onSelected!();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          // mainAxisAlignment : MainAxisAlignment.end,
                          children: [
                            if (e.icon != null || e.imageUrl != null) ...[
                              ConditionalBuilder(
                                condition: e.icon != null,
                                onBuild: Icon(
                                  e.icon,
                                  color: e.color,
                                ),
                                onFeedBack: e.imageUrl != null
                                    ? Image.asset(
                                        "${e.imageUrl}",
                                        scale: 4,
                                      )
                                    : null,
                              ),
                              const Spacer(),
                            ],
                            CustomText.subtitle(e.label,
                                color: e.color ?? Colors.black),
                          ],
                        ),
                        // if (e.hasBorder)
                        //   XDivider.normal(
                        //     verticalPadding: 5.0,
                        //   ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList();
      },
    );
  }
}

enum PopUpMenuStyle { horizontal, vertical }

Icon _defaultIcon(PopUpMenuStyle style) {
  switch (style) {
    case PopUpMenuStyle.horizontal:
      return const Icon(
        Icons.more_horiz,
        color: AppColors.primary,
      );
    case PopUpMenuStyle.vertical:
      return Icon(
        Icons.adaptive.more,
        color: AppColors.secondary,
      );
  }
}
