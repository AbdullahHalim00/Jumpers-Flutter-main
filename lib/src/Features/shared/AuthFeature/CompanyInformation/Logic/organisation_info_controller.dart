import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/geolocation_services.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MapFeature/ui/screen/imports_map_screen.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Data/params/organisation_info_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Data/repository/organisation_info_repo.dart';
import 'package:jumper/src/Ui/BottomSheet/BottomSheets/cities_bottom_sheet.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class OrganisationController extends GetxController {
  final bool isBusinessOwnerEdit;
  final bool isOrganizationEdit;
  final bool isAdminEdit;

  OrganisationController({
    this.isBusinessOwnerEdit = false,
    this.isOrganizationEdit = false,
    this.isAdminEdit = false,
  });

  TextEditingController? adminNameController;
  TextEditingController? adminEmailController;
  TextEditingController? adminPhoneController;
  TextEditingController? adminTypeController;
  TextEditingController? noteController;

  // TextEditingController? workActivityController;
  // TextEditingController? sectorController;
  // TextEditingController? crNumController;
  TextEditingController? headquarterAddressController;
  TextEditingController commercialNumberController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController builderNumberController = TextEditingController();
  TextEditingController ipanNumberController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController? headquarterCityController;
  TextEditingController? identityNumController;
  TextEditingController? identityTypeIdController;

  // TextEditingController ipanNewNumberController= TextEditingController();
  // TextEditingController bankNewAccountNumberController= TextEditingController();
  File? _avatar;

  void setAvatar(File avatar) {
    _avatar = avatar;
    update();
  }

  String _futureImage = '';

  String get futureImage => _futureImage;

  int _organisationTypeId = 0;

  int get organisationTypeId => _organisationTypeId;
  final DataBase _dataBase = Get.find();

  setOrganisationTypeId(int organisationTypeId) {
    printDM("organisationTypeId is $organisationTypeId");
    _organisationTypeId = organisationTypeId;
    printDM("_organisationTypeId is $_organisationTypeId");
    update();
  }

  int _adminTypeId = 0;

  int get adminTypeId => _adminTypeId;

  void setAdminTypeId(int adminTypeId) {
    _adminTypeId = adminTypeId;
    update();
  }

  // int _workActivityId = 0;
  //
  // int get workActivityId => _workActivityId;
  //
  // void setWorkActivityId(int workActivityId) {
  //   _workActivityId = workActivityId;
  //   update();
  // }

  // int _sectorId = 0;
  //
  // int get sectorId => _sectorId;
  //
  // void setSectorId(int sectorId) {
  //   _sectorId = sectorId;
  //   update();
  // }

  int _headquarterCityId = 0;

  int get headquarterCityId => _headquarterCityId;

  void setHeadquarterCityId(int headquarterCityId) {
    _headquarterCityId = headquarterCityId;
    update();
  }

  int _identityTypeId = 0;

  int get identityTypeId => _identityTypeId;

  void setIdentityTypeId(int identityTypeId) {
    _identityTypeId = identityTypeId;
    update();
  }

  double? _lat;
  double? _lon;

  Future<void> _getLocation() async {
    final locationResponse = await GeolocationServices().determinePosition();
    _lat = locationResponse!.position!.latitude;
    _lon = locationResponse.position!.longitude;
    printDM("_lat in add is $_lat");
    printDM("_lon in add is $_lon");
    update();
  }

  void openCitiesBottomSheet() {
    AppSheet.showDefaultSheet(
      CitiesBottomSheet(onSave: (id, title) {
        headquarterCityController!.text = title;
        setHeadquarterCityId(id);
      }),
    );
  }

  void moveToMap() {
    if (_lat == null) {
      _getLocation().then((value) => Get.to(
            () => MapScreen(
              currentPosition: LatLng(_lat!, _lon!),
              onSave: (address, latLon) {
                headquarterAddressController!.text = address;
                _lat = latLon.latitude;
                _lon = latLon.longitude;
                printDM('_lat in add is $_lat');
                printDM('_lon in controller id $_lon');
                update();
              },
            ),
          ));
    } else {
      Get.to(
        () => MapScreen(
          currentPosition: LatLng(_lat!, _lon!),
          onSave: (address, latLon) {
            headquarterAddressController!.text = address;
            _lat = latLon.latitude;
            _lon = latLon.longitude;
            printDM('_lat in add is $_lat');
            printDM('_lon in controller id $_lon');
            update();
          },
        ),
      );
    }
  }

  final OrganisationInfoRepository _organisationInfoRepository =
      Get.put(OrganisationInfoRepository());
  final GlobalKey<FormState> organisationTypeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> organisationNewTypeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> adminDataKey = GlobalKey<FormState>();

  DataState<UserModel>? dataState = const DataInitial();

  void moveToSecondPage() {
    if (organisationTypeKey.currentState!.validate()) {
      organisationTypeKey.currentState!.save();
      onNextPage();
    }
  }

  void register(int type) async {
    if (type == 1
        // ? organisationTypeKey.currentState!.validate()
        ? adminDataKey.currentState!.validate()
        : organisationNewTypeKey.currentState!.validate()) {
      printDM('enter hear 1111111');
      if (type == 1) {
        // organisationTypeKey.currentState!.save();
        adminDataKey.currentState!.save();
      } else {
        organisationNewTypeKey.currentState!.save();
      }
      dataState = const DataLoading();
      update();
      dataState = await _organisationInfoRepository.enterOrganisationInfo(
          params: OrganisationInfoRequestParams(
        organisationTypeId: _organisationTypeId,
        adminName: adminNameController!.text,
        adminTypeId: _adminTypeId,
        adminEmail: adminEmailController!.text,
        adminPhone: adminPhoneController!.text,
        adminNote: noteController!.text,
        // workActivityId: _workActivityId,
        // sectorId: _sectorId,
        // crNum: crNumController!.text,
        commecialNumber: commercialNumberController.text,
        taxNumber: taxNumberController.text,
        builderNumber: builderNumberController.text,
        ipanNumber: ipanNumberController.text,
        bankAccountNumber: bankAccountNumberController.text,
        headquarterAddress: headquarterAddressController!.text,
        headquarterCityId: _headquarterCityId,
        lat: _lat,
        lon: _lon,
        identityNum: identityNumController!.text,
        identityTypeId: _identityTypeId,
        image: _avatar,
      ));
      update();
      if (dataState is DataSuccess) {
        _dataBase.loginUser();
        _dataBase.storeUserModel(dataState!.data!);
        Get.offAll(
          () => const CompanyBaseScreen(),
          transition: Transition.fade,
          duration: AppDurations.mainTransition,
        );
      }
    }
  }

  //////////////// fetch local data to edit is \\\\\\\\\\\\\\\\
  void restoreBusinessOwnerInfo() {
    _futureImage = _dataBase.restoreUserModel().image;
    _organisationTypeId = _dataBase.restoreUserModel().companyType;
    identityTypeIdController!.text = _dataBase.restoreUserModel().identityTitle;
    _identityTypeId = _dataBase.restoreUserModel().identityId;
    ipanNumberController.text = _dataBase.restoreUserModel().ipanNumber;
    bankAccountNumberController.text =
        _dataBase.restoreUserModel().banckAccountNumber;
    identityNumController!.text = _dataBase.restoreUserModel().identityNumber;
    update();
  }

  void restoreOrganizationInfo() {
    _futureImage = _dataBase.restoreUserModel().image;
    _organisationTypeId = _dataBase.restoreUserModel().companyType;
    headquarterCityController!.text = _dataBase.restoreUserModel().cityTitle;
    _headquarterCityId = _dataBase.restoreUserModel().cityId;
    commercialNumberController.text =
        _dataBase.restoreUserModel().commercialNumer;
    taxNumberController.text = _dataBase.restoreUserModel().taxNumber;
    builderNumberController.text = _dataBase.restoreUserModel().buildingNumber;
    ipanNumberController.text = _dataBase.restoreUserModel().ipanNumber;
    bankAccountNumberController.text =
        _dataBase.restoreUserModel().banckAccountNumber;

    headquarterAddressController!.text = _dataBase.restoreUserModel().address;
    _lat = _dataBase.restoreUserModel().lat;
    _lon = _dataBase.restoreUserModel().lon;
    update();
  }

  void restoreAdminInfo() {
    _organisationTypeId = _dataBase.restoreUserModel().companyType;
    adminNameController!.text = _dataBase.restoreUserModel().managerName;
    adminTypeController!.text =
        _dataBase.restoreUserModel().responsibleAttributeTitle;
    ipanNumberController.text = _dataBase.restoreUserModel().ipanNumber;
    bankAccountNumberController.text =
        _dataBase.restoreUserModel().banckAccountNumber;
    _adminTypeId = _dataBase.restoreUserModel().responsibleAttributeId;
    adminEmailController!.text = _dataBase.restoreUserModel().managerEmail;
    adminPhoneController!.text = _dataBase.restoreUserModel().managerPhone;
    noteController!.text = _dataBase.restoreUserModel().managerNote;
  }

  //////////////// change organization info \\\\\\\\\\\\\\\\
  OrganisationInfoRequestParams editParams() {
    if (isBusinessOwnerEdit) {
      printDM("edit BusinessOwner");
      return OrganisationInfoRequestParams(
        image: _avatar,
        organisationTypeId: _organisationTypeId,
        identityNum: identityNumController!.text,
        identityTypeId: _identityTypeId,
        commecialNumber: commercialNumberController.text,
        taxNumber: taxNumberController.text,
        builderNumber: builderNumberController.text,
        headquarterAddress: headquarterAddressController!.text,
        headquarterCityId: _headquarterCityId,
        ipanNumber: ipanNumberController.text,
        bankAccountNumber: bankAccountNumberController.text,
        lat: _lat,
        lon: _lon,
      );
    } else if (isOrganizationEdit) {
      printDM("edit Organization");
      return OrganisationInfoRequestParams(
        image: _avatar,
        organisationTypeId: _organisationTypeId,
        headquarterAddress: headquarterAddressController!.text,
        headquarterCityId: _headquarterCityId,
        commecialNumber: commercialNumberController.text,
        taxNumber: taxNumberController.text,
        builderNumber: builderNumberController.text,
        ipanNumber: ipanNumberController.text,
        bankAccountNumber: bankAccountNumberController.text,
        lat: _lat,
        lon: _lon,
      );
    } else if (isAdminEdit) {
      printDM("edit Admin");
      return OrganisationInfoRequestParams(
        organisationTypeId: _organisationTypeId,
        adminName: adminNameController!.text,
        adminTypeId: _adminTypeId,
        adminEmail: adminEmailController!.text,
        adminPhone: adminPhoneController!.text,
        adminNote: noteController!.text,
      );
    } else {
      return OrganisationInfoRequestParams();
    }
  }

  void editOrganisationInfo(int type) async {
    log("Helelo");

    if (isAdminEdit) {
      if (organisationTypeKey.currentState!.validate()) {
        organisationTypeKey.currentState!.save();
        dataState = const DataLoading();
        update();
        dataState = await _organisationInfoRepository.enterOrganisationInfo(
            params: editParams());
        log("Helelo1111");
        update();
        if (dataState is DataSuccess) {
          _dataBase.storeUserModel(dataState!.data!);
          Get.back();
          AppSnacks.successMessage(
            message: "edit_successfully".tr,
          );
        }
      }
    } else {
      if (type == 1
          ? organisationTypeKey.currentState!.validate()
          : organisationNewTypeKey.currentState!.validate()) {
        printDM('enter hear 1111111');
        if (type == 1) {
          organisationTypeKey.currentState!.save();
        } else {
          organisationNewTypeKey.currentState!.save();
        }
        dataState = const DataLoading();
        update();
        log("Helel222222");

        dataState = await _organisationInfoRepository.enterOrganisationInfo(
            params: editParams());
        update();
        if (dataState is DataSuccess) {
          _dataBase.storeUserModel(dataState!.data!);
          Get.back();
          AppSnacks.successMessage(
            message: "edit_successfully".tr,
          );
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    adminNameController = TextEditingController();
    adminPhoneController = TextEditingController();
    adminTypeController = TextEditingController();
    noteController = TextEditingController();
    adminEmailController = TextEditingController();
    // workActivityController = TextEditingController();
    // sectorController = TextEditingController();
    // crNumController = TextEditingController();
    headquarterAddressController = TextEditingController();
    headquarterCityController = TextEditingController();
    identityNumController = TextEditingController();
    identityTypeIdController = TextEditingController();

    if (isBusinessOwnerEdit) {
      restoreBusinessOwnerInfo();
    } else if (isOrganizationEdit) {
      restoreOrganizationInfo();
    } else if (isAdminEdit) {
      restoreAdminInfo();
    }

    if (_lat == null && _lon == null) {
      _getLocation();
    }
  }

  @override
  void dispose() {
    adminNameController?.dispose();
    adminPhoneController?.dispose();
    adminTypeController?.dispose();
    noteController?.dispose();
    adminEmailController?.dispose();
    // workActivityController?.dispose();
    // sectorController?.dispose();
    // crNumController?.dispose();
    headquarterAddressController?.dispose();
    headquarterCityController?.dispose();
    identityNumController?.dispose();
    identityTypeIdController?.dispose();
    super.dispose();
  }

  PageController pageController = PageController();
  int currentPageViewIndex = 0;

  void onNextPage() {
    pageController.nextPage(
      duration: const Duration(microseconds: 750),
      curve: Curves.fastLinearToSlowEaseIn,
    );

    update();
  }

  void onLastPage() {
    pageController.previousPage(
      duration: const Duration(microseconds: 750),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    update();
  }

  void onPageChanged(int index) {
    currentPageViewIndex = index;
    update();
  }
}
