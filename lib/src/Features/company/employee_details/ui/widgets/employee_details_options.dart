part of 'imports_widgets_employee_details.dart';

class EmployeeDetailsOptions extends StatelessWidget {
  final EmployeeModel employee;
  bool inFav;

  EmployeeDetailsOptions(
    this.employee, this.inFav, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatsController _ChatsController = Get.find<ChatsController>();
    // final MyFavEmployeesController _myFavEmployeesController = Get.find<MyFavEmployeesController>();
    return GetBuilder<FavEmployeeController>(builder: (favController) {
      return DefaultPopUpButton(
        hasBCG: false,
        popUps: [
          PopUpModel(
            imageUrl: Assets.sendMessage,
            label: "send_message".tr,
            onSelected: () {
              _ChatsController.startChat(
                targetName: employee.name,
                targetID: employee.id,
                targetImage: employee.image,
                targetToken: employee.deviceToken,
                chatType: 'user',
              );
            },
          ),
          // PopUpModel(
          //   imageUrl: Assets.phone,
          //   label: "call".tr,
          //   onSelected: () {
          //     Get.back();
          //     Get.to(
          //       () => const CallScreen(),
          //     );
          //   },
          // ),
          PopUpModel(
            // imageUrl: Assets.heart,
            icon: inFav
              ? Icons.favorite
              : Icons.favorite_border_outlined,
            color: inFav
              ? Colors.red
              : Colors.black,
            label: inFav
              ? "delete_from_fav".tr
              : "add_to_fav".tr,
            onSelected: () async{
              await Utils.closeSnackbar();
              inFav = !inFav;
              favController.update();
              Get.back();
              var newStatus = await favController.changeFav(
                employee.id,
              );
              if(newStatus == null){
                inFav = !inFav;
                favController.update();
              }
              // _.favouriteEmployee(employee.id);
            },
          ),
          // PopUpModel(
          //   imageUrl: Assets.period,
          //   label: "extend_period".tr,
          //   onSelected: () {
          //     AppSheet.showDefaultSheet(
          //       SheetExtendPeriod(employeeId: employee.id),
          //     );
          //   },
          //   hasBorder: true,
          // ),
          // PopUpModel(
          //   imageUrl: Assets.closeRed,
          //   label: "fire".tr,
          //   onSelected: () {
          //
          //     _.fireEmployee(employee.id);
          //   },
          //   color: AppColors.red,
          // ),
        ],
      );
    });
  }
}
