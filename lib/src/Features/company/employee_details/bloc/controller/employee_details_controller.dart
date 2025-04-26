import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/fav_employee_controller.dart';
import 'package:jumper/src/Features/company/employee_details/ui/widgets/imports_widgets_employee_details.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

class EmployeeDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  TickerProviderStateMixin? tickerProviderStateMixin;

  TabController? _tabController;

  TabController? get tabController => _tabController;

  void fireEmployee(int id) {
    Utils.showDialog(
      child: BuildTerminationDialog(employeeId: id),
    );
  }

  void openExtendPeriodSheet() {
    AppSheet.showDefaultSheet(
      const SheetExtendPeriod(),
    );
  }

  void showPeriodExtendedSuccess() {
    Utils.showDialog(
      child: const BuildExtendPeriodSuccessDialog(),
    );
  }

  // Future<bool?> favouriteEmployee(int id) async {
  //   Get.back();
  //   FavEmployeeController favEmployeeController =
  //       Get.put(FavEmployeeController());
  //   final isFav = await favEmployeeController.changeFav(id);
  //   return isFav;
  //   // if(isFav) 
  //   // MyFavEmployeesController myFavEmployeesController =Get.find();
  //   //  await myFavEmployeesController.getMyFavEmployees();
  // }

  @override
  void onInit() {
    _tabController = TabController(
      length: 1, // 2
      initialIndex: 0,
      vsync: this,
    );
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
