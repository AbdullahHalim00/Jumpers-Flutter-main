// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jumper/src/Core/utils/date_utilities.dart';
// import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/screens/imports_create_new_application.dart';
// import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/widgets/imports_widget_create_new_application.dart';
// import 'package:jumper/src/Features/company/MapFeature/ui/screen/imports_map_screen.dart';
// import 'package:jumper/src/Ui/adaptive/adaptive_picker.dart';
// import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
//
// class CreateJobApplicationController extends GetxController {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//
//
//   final String? title;
//
//   CreateJobApplicationController({this.title});
//
//
//
//   GlobalKey<FormState> get formKey => _formKey;
//
//   /// **** ------------------ service controller ------------------ *****
//   TextEditingController? serviceNameController;
//   TextEditingController? serviceIdController;
//   TextEditingController? jumpersController;
//   TextEditingController? nationalityController;
//   // void setServiceName(String value) {
//   //   serviceNameController?.text = value;
//   // }
//
//   void onServiceTapped() {
//     AppSheet.showBottomSheet(
//       BuildChooseServiceNameSheet(
//         onConfirmed: (String value , int id) {
//           serviceNameController?.text = value;
//
//           print("serviceName controller => ${serviceNameController!.text}");
//         },
//       ),
//       title: "the_work_field".tr,
//       onSavePress: () => Get.back(),
//       onSaveTitle: "done".tr,
//     );
//   }
//
//
//   /// **** ------------------ service controller ------------------ *****
//
//   /// **** ------------------ Jumper controller ------------------*****
//
//
//   /// **** ------------------ Nationality controller ------------------*****
//
//   void  setNationality(String value) {
//     nationalityController?.text = value;
//   }
//
//   void onNationalityTapped() {
//     AppSheet.showBottomSheet(const BuildChooseNationalitySheet(),
//         title: "nationality".tr, onSavePress: () {
//       Get.back();
//     });
//   }
//
//   /// **** ------------------ Gender controller ------------------*****
//   TextEditingController? genderController;
//
//   void setGender(String value) {
//     genderController?.text = value;
//   }
//
//   void onGenderTapped() {
//     AppSheet.showBottomSheet(const BuildChooseGenderSheet(), title: "gender".tr,
//         onSavePress: () {
//       Get.back();
//     });
//   }
//
//   /// **** ------------------  Age controller ------------------*****
//   TextEditingController? ageController;
//
//   void onAgeTapped(BuildContext context) {
//     final nowDate = DateTime.now();
//     const _year = 365;
//     Get.bottomSheet(
//       AdaptivePicker.cupertinoDatePicker(
//         context,
//         title: "date_of_birth".tr,
//         onConfirmLabel: "save".tr,
//         initial: nowDate,
//         minimumYear: nowDate.subtract(Duration(days: _year * 150)).year,
//         minDate: nowDate.subtract(Duration(days: _year * 150)),
//         maxDate: nowDate.add(const Duration(days: 0)),
//         maximumYear: nowDate.year,
//         onConfirm: (ageText) {
//           if (ageText != null) {
//             ageController?.text = DateUtilities.calculateAge(ageText);
//           }
//         },
//       ),
//     );
//   }
//
//   /// **** ------------------  skills controller ------------------*****
//   TextEditingController? skillsController;
//
//   void onSkillsTapped() {
//     AppSheet.showBottomSheet(
//       BuildSelectSkillsSheet(onConfirmed: (value) {
//         skillsController!.text = value!;
//
//         print("Skill controller => ${skillsController!.text}");
//       }),
//       title: "skills".tr,
//       onSavePress: () => Get.back(),
//     );
//   }
//
//   /// **** ------------------  workType controller ------------------*****
//   TextEditingController? workTypeController;
//
//
//   void  setWorkTypes(String value) {
//     workTypeController?.text = value;
//   }
//   void onWorkTypeTapped() {
//     AppSheet.showBottomSheet(
//         const BuildChooseJobTypesSheet(),
//       title: "work_type".tr,
//       onSavePress: () => Get.back(),
//     );
//   }
//
//   /// **** ------------------ languages controller ------------------*****
//
//   TextEditingController? languagesController;
//
//   void onLanguagesTapped() {
//     AppSheet.showBottomSheet(
//       BuildSelectLanguagesSheet(
//           onConfirmed: (value) {
//         languagesController!.text = value!;
//
//         print("languages controller => ${languagesController!.text}");
//       }),
//       title: "language".tr,
//       onSavePress: () => Get.back(),
//     );
//   }
//
//   /// **** ------------------ work Address controller ------------------*****
//   TextEditingController? workLocationController;
//
//   void setWorkAddress(String address) {
//     workLocationController!.text = address;
//   }
//
//   /// **** ------------------ details controller ------------------*****
//   TextEditingController? detailedAddressController;
//
//   bool _isButtonDisabled = true;
//
//   bool get isButtonDisabled => _isButtonDisabled;
//
//   void completeApplication() {
//     Get.to(() => const CompleteApplicationScreen());
//   }
//
//   void moveToMap() {
//     Get.to(() => MapScreen());
//   }
//
//   @override
//   void onInit() {
//     serviceNameController = TextEditingController();
//     serviceIdController = TextEditingController();
//     jumpersController = TextEditingController();
//     nationalityController = TextEditingController();
//     genderController = TextEditingController();
//     ageController = TextEditingController();
//     skillsController = TextEditingController();
//     workTypeController = TextEditingController();
//     languagesController = TextEditingController();
//     workLocationController = TextEditingController(text: "default address");
//     detailedAddressController = TextEditingController();
//
//     if(title!=null){
//       serviceNameController!.text = title!;
//       serviceIdController!.text = '1';
//     }
//
//     languagesController?.addListener(() {
//       if (0==0
//           // serviceNameController!.text.isNotEmpty &&
//           //     jumpersController!.text.isNotEmpty &&
//           //     nationalityController!.text.isNotEmpty &&
//           //     genderController!.text.isNotEmpty &&
//           //     ageController!.text.isNotEmpty &&
//           //     skillsController!.text.isNotEmpty &&
//           //     workTypeController!.text.isNotEmpty &&
//           //     languagesController!.text.isNotEmpty
//               // workLocationController!.text.isNotEmpty
//           ) {
//         _isButtonDisabled = false;
//         update();
//       }
//     });
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     serviceNameController?.dispose();
//     serviceIdController?.dispose();
//     jumpersController?.dispose();
//     nationalityController?.dispose();
//     genderController?.dispose();
//     ageController?.dispose();
//     skillsController?.dispose();
//     workLocationController?.dispose();
//     languagesController?.dispose();
//     workLocationController?.dispose();
//     detailedAddressController?.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
// }
