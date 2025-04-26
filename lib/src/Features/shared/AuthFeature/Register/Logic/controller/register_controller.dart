import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/FCM/fcm_service.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Data/params/register_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Data/repository/register_repo.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Presentation/Screens/verfication_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Presentation/Screens/login_screen.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

import '../../../Verfication/Presentation/Screens/register_verfication_screen.dart';

class RegisterController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  late UserModel _user;

  UserModel get user => _user;

  GetStorage box = GetStorage();
  final RegisterRepository _registerRepository = RegisterRepository();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  GlobalKey<FormState> get globalKey => _globalKey;
  DataState<UserModel>? dataState = const DataInitial();
  final DataBase _dataBase = DataBase();

  void register({required int accType}) async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await _registerRepository.register(
          params: RegisterRequestParams(
        password: passwordController!.text,
        phone: phoneController!.text,
        name: nameController!.text,
        email: emailController!.text,
        accType: accType,
        deviceToken: await FCMService.deviceToken,
        deviceId: await AppData.getDeviceID(),
      ));
      update();
      if (dataState is DataSuccess) {
        _user = dataState!.data!;
        _dataBase.storeUserModel(dataState!.data!);
        update();
        Get.to(
          // RegisterVerificationScreen
          VerificationScreen(
            phone: phoneController!.text,
            password: passwordController!.text,
            register: true,
            accType: accType
          ),
          transition: Transition.fade,
          duration: AppDurations.mainTransition,
        );
        update();
        AppSnacks.loginSuccess();
      }
      // else if (dataState is DataFailed) {
      //   if (dataState!.error!.errorType == ErrorType.networkConnection) {
      //     _status = RequestStatus.connectionError;
      //     // AppSnacks.connectionError();
      //   } else {
      //     _status = RequestStatus.error;
      //     debugPrint(dataState.error.toString());
      //     AppSnacks.requestError(error: dataState.error!.errorTitle);
      //   }
      //   update();
      //   debugPrint(dataState.error.toString());
      // }
    }
  }
  /// override from [register]
  Future<void> resendVerificationCode({required int accType}) async {
    dataState = const DataLoading();
    update();
    dataState = await _registerRepository.register(
        params: RegisterRequestParams(
      password: passwordController!.text,
      phone: phoneController!.text,
      name: nameController!.text,
      email: emailController!.text,
      accType: accType,
      deviceToken: await FCMService.deviceToken,
      deviceId: await AppData.getDeviceID(),
    ));
    update();
    if (dataState is DataSuccess) {
      _user = dataState!.data!;
      _dataBase.storeUserModel(dataState!.data!);
      update();
      AppSnacks.resendVerifyCodeSuccess();
    }
  }

  void moveToLoginScreen() {
    Get.to(
      () => const LoginScreen(
        accType: 1,
      ),
      transition: Transition.fade,
      duration: AppDurations.mainTransition,
    );
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    emailController?.dispose();
    super.dispose();
  }
}
