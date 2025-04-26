import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class DataBase extends GetxController {
  static final GetStorage _box = GetStorage();

  void storeUser(UserModel user) {
    // _box.remove("user_id");
    _box.write('user_id', user.id);
    // _box.remove("name");
    _box.write('name', user.name);
    // _box.remove("image");
    _box.write('image', user.image);
    // _box.remove("email");
    _box.write('email', user.email);
    // _box.remove("phone");
    _box.write('phone', user.phone);
    // _box.remove("api_token");
    _box.write('api_token', user.apiToken);
    // _box.remove("accType");
    _box.write('accType', user.type);
    _box.write('organization_type', user.companyType);
    _box.write('verify_email', user.verifyEmail);
    // box.write('verify_phone', user.phoneVerify);
    // sharedPreferences.setInt('block', user.block??0);
  }

  void loginUser() {
    _box.write('login', true);
  }

  void verifyPhoneStatus(String status) {
    _box.write('inVerifyPhone', status);
  }

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void storeUserModel(UserModel model) {
    _box.write('accType', model.type);
    _box.write('organization_type', model.companyType);
    printDM('enter storeUserModel step 0');
    log("dataState!.data! ${model.toJson()}");
    // log(model.toJson().toString());
    // print(model.toString());
    _box.write('user_model', model.toJson());
    printDM('in storeUserModel ${model.toJson()}');
    // printDM('enter storeUserModel step 1');
  }

  UserModel restoreUserModel() {
    printDM('enter restoreUserModel step 0');

    // log("_box.read('user_model').toString()1");
    // log(_box.read('user_model').toString());
    // log("_box.read('user_model').toString()33");
    // log(UserModel.fromJson(_box.read('user_model')).services.toString());



    final map = _box.read('user_model') ??
        {
          "id": 97,
          "name": "Ana De Armas",
          "email": "test12@gmail.com",
          "phone": "123123122",
          "type": 1,
          "notify_status": 1,
          "api_token":
              "\$2y\$10\$MD6nRYfa1wk9DFfg1u4OO.AhoPGsRHBaveuWdwQCIPdk1G7v4U0Xq",
          "company_type": 0,
          "image":
              "https://media.istockphoto.com/id/182676104/photo/muslim-young-man.jpg?s=1024x1024&w=is&k=20&c=LmNykWAbK9ymQ6zf2TznL7QQxTHZv_4cNvHVgGXZBLE=",
          "work_activity_title": "",
          "work_activity_id": 0,
          "sector_title": "",
          "sector_id": 0,
          "identity_title": "",
          "identity_id": 0,
          "city_title": "",
          "city_id": 0,
          "responsible_attribute_title": "",
          "responsible_attribute_id": 0,
          "manager_name": "",
          "manager_email": "",
          "manager_phone": "",
          "identity_number": "",
          "cr_no": "",
          "skills": [],
          "languages": [],
          "gender": 1,
          "cv": "",
          "city": "",
          "nationality": "",
          "nationality_id": 0,
          "about": "",
          "verify_email": 0,
          "complete_info": 0,
          "birthday": "",
          "address": "",
          "commercial_register": "",
          "tax_number": "",
          "building_number": "",
          "iban": "",
          "account_number": "",
          "lat": 0.0,
          "lon": 0.0,
          "services": [],
          "service_images": [],
          "manager_notes": ""
        };
    // printDM('enter restoreUserModel map is $map');
    // printDM('enter restoreUserModel step 1');
    update();
    return UserModel.fromJson(map);
  }

  static Future<void> clearStorage() async {
    await _box.erase();
  }

//how to use
//Get.find<Database>().restoreModel().val
}

//
// Future<String> fetchUserName()async{
//   var authBox = await Hive.openBox('auth');
//   return authBox.get('name');
// }
//
// Future<String> fetchApiToken()async{
//   var authBox = await Hive.openBox('auth');
//   return authBox.get('api_token')??'';
// }
//
//
// Future<String> fetchEmail()async{
//   var authBox = await Hive.openBox('auth');
//   return authBox.get('email')??'';
// }
//
// Future<String> fetchPhone()async{
//   var authBox = await Hive.openBox('auth');
//   return authBox.get('phone')??'';
// }
//
//
// Future<bool> fetchIfLogin()async{
//   var authBox = await Hive.openBox('auth');
//   return authBox.get('login')??false;
// }
//
// Future logOut()async{
//   var authBox = await Hive.openBox('auth');
//   authBox.clear();
// }
//
//
//
// void registerOnBoard()async{
//   var onBoardBox = await Hive.openBox('onBoard');
//   onBoardBox.put('onBoard',true);
// }
//
//
// Future<bool> fetchOnBoard()async{
//   var onBoardBox = await Hive.openBox('onBoard');
//   return onBoardBox.get('onBoard')??false;
// }
