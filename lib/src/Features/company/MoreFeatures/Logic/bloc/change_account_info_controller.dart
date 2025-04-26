import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_account_info_params.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_email_params.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/repository/change_account_info_repo.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/repository/change_email_repo.dart';
import 'package:jumper/src/Features/company/MoreFeatures/ui/screens/change_email_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Presentation/Screens/verfication_screen.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class ChangeAccountInfoController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? newEmailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final DataBase _dataBase = Get.put(DataBase());
  late UserModel user;
  GetStorage box = GetStorage();
  final ChangeAccountInfoRepository _changeAccountInfoRepository =
      ChangeAccountInfoRepository();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  GlobalKey<FormState> get globalKey => _globalKey;
  DataState<UserModel>? dataState = const DataInitial();

////////////////////// to change name and phone \\\\\\\\\\\\\\\\\\\\\\
  void changeAccountInfo() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await _changeAccountInfoRepository.changeAccountInfo(
          params: ChangeAccountInfoRequestParams(
        name: nameController!.text,
        phone: phoneController!.text,
      ));
      update();
      if (dataState is DataSuccess) {
        user = dataState!.data!;
        _dataBase.storeUserModel(dataState!.data!);
        Get.back();
        AppSnacks.successMessage(message: dataState!.message);
        update();
      }
    }
  }

  final ChangeEmailRepository _changeEmailRepository =
      Get.put(ChangeEmailRepository());
  final GlobalKey<FormState> _globalKey2 = GlobalKey<FormState>();

  GlobalKey<FormState> get globalKey2 => _globalKey2;

  ////////////////////// to change email \\\\\\\\\\\\\\\\\\\\\\
  void changeEmail() async {
    if (_globalKey2.currentState!.validate()) {
      _globalKey2.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await _changeEmailRepository.changeEmail(
        params: ChangeEmailRequestParams(
          email: newEmailController!.text,
          password: passwordController!.text,
        ),
      );
      update();
      if (dataState is DataSuccess) {
        user = dataState!.data!;
        _dataBase.storeUserModel(dataState!.data!);
        update();
        Get.to(
          VerificationScreen(
            isEdit: true,
            phone: phoneController!.text,
          ),
          transition: Transition.fade,
          duration: AppDurations.mainTransition,
        );
        update();
      } else {
        Utils.showToast(
            title: "${dataState?.error?.errorTitle}", state: UtilState.Error);
        Get.back();
      }
    }
  }

  void setData() {
    nameController!.text = _dataBase.restoreUserModel().name;
    phoneController!.text = _dataBase.restoreUserModel().phone;
    emailController!.text = _dataBase.restoreUserModel().email;
  }

  bool _activeButton = false;

  bool get activeButton => _activeButton;

  void listen() {
    nameController!.addListener(() {
      if (_dataBase.restoreUserModel().name != nameController!.text) {
        _activeButton = true;
        printDM("activeButton is true");
      } else {
        _activeButton = false;
        printDM("activeButton is false");
      }
      update();
    });
    phoneController!.addListener(() {
      if (_dataBase.restoreUserModel().phone != phoneController!.text) {
        _activeButton = true;
        printDM("activeButton is true");
      } else {
        _activeButton = false;
        printDM("activeButton is false");
      }
      update();
    });
  }

  void moveToChangeEmailScreen() {
    Get.to(
      () => ChangeEmailScreen(),
      transition: Transition.fade,
      duration: AppDurations.mainTransition,
    );
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    newEmailController = TextEditingController();
    passwordController = TextEditingController();
    listen();
    setData();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    newEmailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }
}
