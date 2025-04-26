import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/add_job_controller.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

List<int> allowedAges = List<int>.generate(83, (i) => i + 18);

class SheetSelectAge extends StatelessWidget {
  final void Function(int? ageFrom, int? ageTo) onSavePress;

  const SheetSelectAge({
    Key? key,
    required this.onSavePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddJobController>(builder: (_) {
      int initialItemFrom = _.initialAgeFrom - 18;
      int initialItemTo = _.initialAgeTo - 18;
      return SheetHeader(
        title: "age_selection".tr,
        onSavePress: () {
          onSavePress(allowedAges.elementAt(initialItemFrom),
              allowedAges.elementAt(initialItemTo));
          Get.back();
        },
        sheetBody: Padding(
          padding: AppInsets.defaultScreenALL,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// age from
              Expanded(
                child: Column(
                  children: [
                    const CustomText("age_from"),
                    Expanded(
                      child: CupertinoPicker.builder(
                        scrollController: FixedExtentScrollController(
                          initialItem: initialItemFrom,
                        ),
                        childCount: allowedAges.length,
                        useMagnifier: true,
                        selectionOverlay:
                            CupertinoPickerDefaultSelectionOverlay(
                          background:
                              CupertinoColors.tertiaryLabel.withOpacity(0.1),
                        ),
                        squeeze: 1,
                        magnification: 1.2,
                        // offAxisFraction: -0.4,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomText("${allowedAges[index]}");
                        },
                        onSelectedItemChanged: (value) {
                          _.setInitialAgeFrom(allowedAges[value]);
                        },
                        itemExtent: 30,
                      ),
                    ),
                  ],
                ),
              ),

              // XDivider.semiFaded(),
              /// age to

              Expanded(
                child: Column(
                  children: [
                    const CustomText("to"),
                    Expanded(
                      child: CupertinoPicker.builder(
                        scrollController: FixedExtentScrollController(
                          initialItem: initialItemTo,
                        ),
                        childCount: allowedAges.length,
                        useMagnifier: true,
                        selectionOverlay:
                            CupertinoPickerDefaultSelectionOverlay(
                          background:
                              CupertinoColors.tertiaryLabel.withOpacity(0.1),
                        ),
                        squeeze: 1,
                        magnification: 1.2,
                        // offAxisFraction:  0.4,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomText("${allowedAges[index]}");
                        },
                        onSelectedItemChanged: (value) {
                          _.setInitialAgeTo(allowedAges[value]);
                        },
                        itemExtent: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // TabBar(
              //   tabs: [
              //     Tab(
              //       text: "age_from".tr,
              //     ),
              //     Tab(
              //       text: "to".tr,
              //     ),
              //   ],
              // ),
              // Expanded(
              //   child: TabBarView(
              //     physics: AppPhysics.alwaysScrollablePhysics,
              //     children: [
              //
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
