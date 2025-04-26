import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/FCM/fcm_service.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/ui/screens/imports_jumper_base%20.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Screens/check_phone_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Screen/organisation_info_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Ui/jumper_employment_info_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Ui/jumper_personal_info_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Presentation/Screens/register_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Presentation/Screens/verfication_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Data/params/login_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Data/repository/login_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

import '../../../../../jumper/WalletFeature/Ui/screen/imports_wallet_screen.dart';

class LoginController extends GetxController {
  final DataBase _dataBase = DataBase();
  late UserModel _user;

  UserModel get user => _user;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository = LoginRepository();
  DataState<UserModel>? _dataState = const DataInitial();

  DataState<UserModel>? get dataState => _dataState;

  void login() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      _dataState = const DataLoading();
      update();
      _dataState = await _loginRepository.login(
          params: LoginRequestParams(
        phone: phoneController!.text,
        password: passwordController!.text,
        deviceToken: await FCMService.deviceToken,
        deviceId: await AppData.getDeviceID(),
      ));
      printDM("OH NOOOO : ${_dataState!.data}");
      update();
      printDM('enter loginController step 0');
      if (_dataState is DataSuccess) {
        _user = _dataState!.data!;
        printDM('_user.completeInfo ${_user.completeInfo}');
        printDM('enter loginController step 1');
        print("services");
        print(_user.services.toString());
        _dataBase.storeUserModel(_user);
        printDM('enter loginController step 2');
        if (_user.verifyEmail == 0) {
          AppSnacks.loginSuccess();
          Get.to(
            VerificationScreen(
              phone: phoneController!.text,
            ),
            transition: Transition.fade,
            duration: AppDurations.mainTransition,
          );
        } else {
          if (_user.type == 0) {
            ///////////// organization account \\\\\\\\\\\\\\
            if (_user.completeInfo == 0) {
              Get.offAll(
                () => const OrganisationInfoScreen(),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
            } else {
              Get.offAll(
                () => const CompanyBaseScreen(),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
              _dataBase.loginUser();
            }
          } else {
            ///////////// jumper account \\\\\\\\\\\\\\
            if (_user.completeInfo == 0) {
              Get.offAll(
                () => const JumperInfoScreen(),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
            } else if (_user.completeInfo == 1) {
              Get.offAll(
                () => const EmploymentInfoScreen(),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
            } else if (_user.walletBank!.bankAccountTypeTitle.isEmpty) {
              Get.offAll(
                () => const BankAccountSettingScreen(canGoBack: false, enteredInLogin: true),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
            } else {
              Get.offAll(
                () => const JumperBaseScreen(),
                transition: Transition.fade,
                duration: AppDurations.mainTransition,
              );
              _dataBase.loginUser();
            }
          }
        }
        update();
        // if(!(_user.type != 0 && _user.walletBank!.bankAccountTypeTitle.isEmpty)) AppSnacks.loginSuccess(); 
      } else {
        update();
        Utils.showToast(
          title: "${dataState?.error?.errorTitle}",
          state: UtilState.Error,
        );
      }
    }
  }

  /// override from [login] function
  /// 
  /// must pass [password], [phone] if user register
  Future<void> resendVerificationCode({
    String? phone, String? password
  }) async {
      _dataState = const DataLoading();
      update();
      _dataState = await _loginRepository.login(
          params: LoginRequestParams(
        phone: phone ?? phoneController!.text.trim(),
        password: password ?? passwordController!.text.trim(),
        deviceToken: await FCMService.deviceToken,
        deviceId: await AppData.getDeviceID(),
      ));
      printDM("OH NOOOO : ${_dataState!.data}");
      update();
      printDM('enter loginController step 0');
      if (_dataState is DataSuccess) {
        _user = _dataState!.data!;
        printDM('enter loginController step 1');
        print("services");
        print(_user.services.toString());
        _dataBase.storeUserModel(_user);
        printDM('enter loginController step 2');
        if (_user.verifyEmail == 0) {
          // 
        }
        update();
        AppSnacks.resendVerifyCodeSuccess();
      } else {
        update();
        Utils.showToast(
          title: "${dataState?.error?.errorTitle}",
          state: UtilState.Error,
        );
      }  }


  void moveToResetPassword() {
    Get.to(
      () => const CheckPhoneScreen(),
      transition: Transition.fade,
      duration: AppDurations.mainTransition,
    );
  }

  void moveToRegister({required int accType}) {
    // Get.back();
    Get.to(
      () => RegisterScreen(accType: accType),
      transition: Transition.fade,
      duration: AppDurations.mainTransition,
    );
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }
}
