import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';

class AccountController extends GetxController {
  /// Cached data from LocalStorage
  UserModel get getUser {
    final _dataBase = Get.find<DataBase>();
    final user = _dataBase.restoreUserModel();
    return user;
  }

  @override
  void onInit() {
    getUser;
    // TODO: implement onInit
    super.onInit();
  }
}
