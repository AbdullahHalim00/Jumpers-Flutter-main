import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/employee_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/fav_employee_controller.dart';
import 'package:jumper/src/Features/company/employee_details/ui/screens/imports_employee_details_screen.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/strings/assets.dart';
import '../../Features/company/EmployeesFeature/bloc/controller/my_fav_employees_controller.dart';
import '../builders/conditional_builder.dart';
import '../containers/default_container.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';
import 'employee_activity_card.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee;

  final bool isActivityDone;
  bool inFav;
  final String? searchedLetter;

  // final VoidCallback ? onDetailsPress ;
  // final VoidCallback ? onExtendPress ;
  // final VoidCallback ? onAddToFav ;
  //

  EmployeeCard({
    Key? key,
    required this.employee,
    this.isActivityDone = false,
    this.inFav = false,
    this.searchedLetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyFavEmployeesController myFavEmployeesController =
        Get.put(MyFavEmployeesController());
    if (myFavEmployeesController.dataState.data != null) {
      inFav = myFavEmployeesController.dataState.data!
              .where((element) => element.id == employee.id)
              .toList()
              .length >
          0;
    }

    return InkWell(
      onTap: () {
        Get.to(() => EmployeeDetailsScreen(employee, inFav));
      },
      child: DefaultContainer(
        padding: AppInsets.defaultScreenALL,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        hasBorder: true,
        isCurvedBorders: true,
        color: AppColors.containerBCGWhite,
        child: Column(
          children: [
            Row(
              children: [
                ConditionalBuilder(
                  condition: employee.image != "",
                  onBuild: CircleAvatar(
                    // radius: ,
                    backgroundColor: AppColors.circleAvatarDarker,
                    backgroundImage: NetworkImage(employee.image),
                  ),
                  onFeedBack: const CircleAvatar(
                    // radius: ,
                    backgroundColor: AppColors.circleAvatarDarker,
                    backgroundImage: AssetImage(Assets.defaultUser),
                  ),
                ),
                XSpace.normal,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConditionalBuilder(
                      condition: searchedLetter != null,
                      onBuild: Builder(builder: (context) {
                        final removedParts = employee.name
                            .replaceAll(RegExp('$searchedLetter'), '.'); // abc
                        // final data = employee.name.replaceAll(RegExp("."), ' '); // abc
                        printDM("removed $removedParts");
                        // printDM("data  $data}");

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 50.w,
                              child: CustomText(
                                employee.name,
                                // fontWeight: FW.light,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: CustomText(
                                removedParts,
                                fontWeight: FW.bold,
                                fontSize: 14,
                                color: AppColors.black_2,
                              ),
                            ),
                          ],
                        );
                      }),
                      onFeedBack: CustomText(
                        employee.name,
                        fontWeight: FW.semiBold,
                        fontSize: 14,
                      ),
                    ),
                    // CustomText(
                    //   employee.name,
                    //   fontWeight: FW.semiBold,
                    //   fontSize: 14,
                    // ),
                    CustomText(
                      employee.service,
                      fontSize: 11,
                    ),
                    CustomText.subtitle(
                      "work".tr +
                          ": " +
                          " ${employee.startWorkTime}" +
                          "-" +
                          employee.endWorkTime,
                      fontSize: 11,
                    ),
                  ],
                ),
                const Spacer(),
                GetBuilder<FavEmployeeController>(
                    init: FavEmployeeController(),
                    builder: (favController) {
                      return inFav
                          ? InkWell(
                              onTap: () async{
                                await Utils.closeSnackbar();
                                inFav = false;
                                favController.update();
                                var newStatus = await favController.changeFav(
                                  employee.id,
                                );
                                if(newStatus == null){
                                  inFav = true;
                                  favController.update();
                                }
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
                          : InkWell(
                              onTap: () async{
                                await Utils.closeSnackbar();
                                inFav = true;
                                favController.update();
                                var newStatus = await favController.changeFav(
                                  employee.id,
                                );
                                if(newStatus == null){
                                  inFav = false;
                                  favController.update();
                                }
                              },
                              child: const Icon(
                                Icons.favorite_border,
                              ),
                            );
                      // DefaultPopUpButton(
                      //   menuStyle: PopUpMenuStyle.horizontal,
                      //   popUps: [
                      //     PopUpModel(
                      //       label: "details".tr,
                      //       onSelected: () {
                      //         Get.back();
                      //         Get.to(() => EmployeeDetailsScreen(employee));
                      //       },
                      //       hasBorder: true,
                      //     ),
                      //     inFav
                      //         ? PopUpModel(
                      //             icon: Icons.favorite,
                      //             color: Colors.red,
                      //             label: "",
                      //             onSelected: () {
                      //               Get.back();
                      //
                      //               favController.changeFav(
                      //                 employee.id,
                      //               );
                      //             },
                      //             hasBorder: true,
                      //           )
                      //         : PopUpModel(
                      //             icon: Icons.favorite_border,
                      //             label: "",
                      //             color: Colors.black,
                      //             onSelected: () {
                      //               Get.back();
                      //               favController.changeFav(employee.id);
                      //             },
                      //             hasBorder: true,
                      //           ),
                      // if (isActivityDone)
                      // PopUpModel(
                      //   label: "extend_period".tr,
                      //   onSelected: () {
                      //     Get.back();
                      //     AppSheet.showDefaultSheet(
                      //       SheetExtendPeriod(employeeId: employee.id),
                      //     );
                      //   },
                      //   hasBorder: false,
                      // ),
                      // ]
                      // ,
                      // );
                    }),
              ],
            ),
            EmployeeActivityCard(
              dateTime: "15/3/2022 ,5:00 PM",
              isActivityDone: isActivityDone,
            )
          ],
        ),
      ),
    );
  }
}
