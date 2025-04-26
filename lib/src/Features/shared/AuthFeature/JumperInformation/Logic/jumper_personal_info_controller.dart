import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/geolocation_services.dart';
import 'package:jumper/src/Core/utils/date_utilities.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MapFeature/ui/screen/imports_map_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/params/jumper_personal_info_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/repository/jumper_personal_info_repo.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Ui/jumper_employment_info_screen.dart';
import 'package:jumper/src/Ui/BottomSheet/BottomSheets/cities_bottom_sheet.dart';
import 'package:jumper/src/Ui/adaptive/adaptive_picker.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class JumperPersonalInfoController extends GetxController {
  final bool isEdit;

  JumperPersonalInfoController({this.isEdit = false});

  TextEditingController? birthdayController;
  TextEditingController? cityController;
  TextEditingController? addressController;
  File? _avatar;

  void setAvatar(File avatar) {
    _avatar = avatar;
    update();
  }

  String _futureImage = '';

  String get futureImage => _futureImage;

  int _genderId = 1;

  int get genderId => _genderId;

  setGenderId(int genderId) {
    _genderId = genderId;
    update();
  }

  int _nationalityId = 1;

  int get nationalityId => _nationalityId;

  void setNationalityId(int nationalityId) {
    _nationalityId = nationalityId;
    update();
  }

  int _cityId = 0;

  int get cityId => _cityId;

  void setCityId(int cityId) {
    _cityId = cityId;
    update();
  }

  double? _lat;
  double? _lon;

  Future<void> _getLocation() async {
    final locationResponse = await GeolocationServices().determinePosition();
    _lat = locationResponse!.position!.latitude;
    _lon = locationResponse.position!.longitude;
    update();
  }

  void moveToMap() {
    printDM("enter her ya ana");
    printDM("enter her ya _lat $_lat");

    if (_lat == null || _lat == 0.0) {
      _getLocation().then((value) => Get.to(
            () => MapScreen(
              currentPosition: LatLng(_lat!, _lon!),
              onSave: (address, latLon) {
                addressController!.text = address;
                _lat = latLon.latitude;
                _lon = latLon.longitude;
                update();
              },
            ),
          ));
    } else {
      print(_lat);
      print(_lon);
      printDM("enter henak ya ana");
      Get.to(() => MapScreen(
            currentPosition: LatLng(_lat!, _lon!),
            onSave: (address, latLon) {
              addressController!.text = address;
              _lat = latLon.latitude;
              _lon = latLon.longitude;
              update();
            },
          ));
    }
  }

  final DataBase _dataBase = Get.find<DataBase>();

  void _getData() {
    cityController!.text = _dataBase.restoreUserModel().cityTitle;
    _cityId = _dataBase.restoreUserModel().cityId;
    birthdayController!.text = _dataBase.restoreUserModel().birthday;
    addressController!.text = _dataBase.restoreUserModel().address;
    _lat = _dataBase.restoreUserModel().lat;
    _lon = _dataBase.restoreUserModel().lon;
    print("_lat");
    print(_lat);
    print("_lon");
    print(_lon);
    _genderId = _dataBase.restoreUserModel().gender;
    _nationalityId = _dataBase.restoreUserModel().nationalityId;
    _futureImage = _dataBase.restoreUserModel().image;
    update();
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final JumperPersonalInfoRepository _jumperPersonalInfoRepository =
      Get.put(JumperPersonalInfoRepository());

  DataState<UserModel>? dataState = const DataInitial();

  void register() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await _jumperPersonalInfoRepository.enterJumperPersonalInfo(
          params: JumperPersonalInfoRequestParams(
        image: _avatar,
        genderId: _genderId,
        nationalityId: _nationalityId,
        birthday: birthdayController!.text,
        cityId: _cityId,
        address: addressController!.text,
        lon: _lon,
        lat: _lat,
      ));
      update();
      if (dataState is DataSuccess) {
        _dataBase.storeUserModel(dataState!.data!);
        if (!isEdit) {
          Get.offAll(
            () => const EmploymentInfoScreen(),
            transition: Transition.fade,
            duration: AppDurations.mainTransition,
          );
        } else {
          Get.back();
          AppSnacks.successMessage(message: dataState!.message);
        }
      }
    }
  }

  void openCitySheet() {
    AppSheet.showDefaultSheet(CitiesBottomSheet(onSave: (id, title) {
      printDM("title selected is $title");
      cityController!.text = title;
      setCityId(id);
    }));
  }

  void openDateSheet(BuildContext context) {
    DateTime nowDate = DateTime.now();
    int _year = 365;
    Get.bottomSheet(
      AdaptivePicker.cupertinoDatePicker(
        context,
        title: "date_of_birth".tr,
        onConfirmLabel: "save".tr,
        initial: nowDate,
        minimumYear: nowDate.subtract(Duration(days: _year * 150)).year,
        minDate: nowDate.subtract(Duration(days: _year * 150)),
        maxDate: nowDate.add(const Duration(days: 0)),
        maximumYear: nowDate.add(const Duration(days: 0)).year,
        onConfirm: (ageText) {
          if (ageText != null) {
            birthdayController!.text = DateUtilities.convertDateToYMD(ageText);
          }
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    birthdayController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    if (isEdit) {
      _getData();
    } else {
      _getLocation();
    }
  }

  @override
  void dispose() {
    birthdayController?.dispose();
    addressController?.dispose();
    cityController?.dispose();
    super.dispose();
  }
}
