import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumper/src/Bloc/models/service.dart';
import 'package:jumper/src/Bloc/models/service_model.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/widgets/imports_widget_create_new_application.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/ui/screens/imports_jumper_base%20.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/service_load.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/params/jumper_employment_info_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/repository/delete_cv_repo.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/repository/jumper_employment_info_repo.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

import '../../../../jumper/WalletFeature/Ui/screen/imports_wallet_screen.dart';

class JumperEmploymentInfoController extends GetxController {
  final bool isEdit;

  JumperEmploymentInfoController({this.isEdit = false});

  void _addService({required ServiceModel service}) {
    bool exist = false;
    for (int index = 0; index < servicesLoad.length; index++) {
      if (servicesLoad[index].serviceModel.id == service.id) {
        // servicesLoad.removeAt(index);
        exist = true;
      }
    }
    if (exist == false) {
      servicesLoad.add(ServiceLoaded(serviceModel: service));
    }
    update();
  }

  void _addFullServiceData(Service service) {
    printDM("user services $service ");
    servicesLoad.add(ServiceLoaded(
      serviceModel: ServiceModel(
        id: service.id,
        title: service.title,
        minimumPrice: service.minimumPrice,
        imagesRequired: service.imagesRequired,
        municipalRequired: service.municipalRequired,
      ),
      municipalImage: service.municipalImages,
      serviceImages: service.serviceImages,
    ));
    update();
  }

  void addServices({required List<ServiceModel> services}) {
    if (services.isNotEmpty) {
      List<int> serviceIds = services.map((e) => e.id).toList();
      for (int index = 0; index < servicesLoad.length; index++) {
        final bool isIdsContained =
            serviceIds.contains(servicesLoad[index].serviceModel.id);
        if (!isIdsContained) {
          servicesLoad.removeAt(index);
        }
      }
      for (var element in services) {
        _addService(service: element);
      }
    } else {
      servicesLoad.clear();
      update();
    }
  }

  Future<File?> _addImage() async {
    Utils.showDialog();
    final image = await Utils.pickImage(source: ImageSource.gallery);
    Utils.closeDialog();
    return image;
  }

  Future<List<File>> _addImages() async {
    Utils.showDialog();
    final images = await Utils.pickImages();
    Utils.closeDialog();
    return images;
  }

  List<int> get requestServicesIds {
    return servicesLoad.map((e) => e.serviceModel.id).toList();
  }

  ///<editor-fold desc="Start MunicipalImage Section ">
  Future<void> addMunicipalImageToServiceLoad(
      {required int serviceIndex}) async {
    final image = await _addImage();
    if (image != null) {
      servicesLoad[serviceIndex].municipalImage = image;
      update();
    }
  }

  Future<void> unSelectMunicipalImageInServiceLoad(
      {required int serviceIndex}) async {
    servicesLoad[serviceIndex].municipalImage = null;
    update();
  }

  List<dynamic>? get municipalRequestImages {
    List<dynamic> loadFiles =
        servicesLoad.map((e) => e.municipalImage ?? '0').toList();
    bool fileExist = false;
    for (var element in loadFiles) {
      if (element is File) {
        fileExist = true;
      }
    }
    return fileExist ? loadFiles : null;
  }

  ///</editor-fold>
  ///<editor-fold desc="Start serviceImages Section ">
  Future<void> addServiceImagesToServiceLoad(
      {required int serviceIndex}) async {
    final images = await _addImages();
    if (images.isNotEmpty) {
      if (servicesLoad[serviceIndex].serviceImages != null) {
        for (var element in images) {
          servicesLoad[serviceIndex].serviceImages!.add(element);
        }
      } else {
        servicesLoad[serviceIndex].serviceImages = images;
      }
    }
    update();
    printDM("A7med Fathi ${servicesLoad[serviceIndex].serviceImages}");
  }

  Future<void> unSelectServiceImagesInServiceLoad(
      {required int serviceIndex, required int imageIndex}) async {
    servicesLoad[serviceIndex].serviceImages?.removeAt(imageIndex);
    update();
  }

  List<dynamic>? get servicesRequestImages {
    List<dynamic> loadFiles =
        servicesLoad.map((e) => e.serviceImages ?? []).toList();
    return loadFiles;
  }

  ///</editor-fold>

  ///<editor-fold desc="validate images required">
  bool get isValidServicesImagesRequired {
    bool isValid = true;
    for (var element in servicesLoad) {
      if (element.serviceModel.imagesRequired == 1) {
        if (element.serviceImages == null || element.serviceImages!.isEmpty) {
          isValid = false;
        }
      }
    }
    return isValid;
  }

  ///</editor-fold>

  ///<editor-fold desc="validate municipal image required">
  bool get isValidateMunicipalImageRequired {
    bool isValid = true;
    for (var element in servicesLoad) {
      if (element.serviceModel.municipalRequired == 1) {
        if (element.municipalImage == null ||
            element.municipalImage == '' ||
            element.municipalImage == '0') {
          isValid = false;
        }
      }
    }
    return isValid;
  }

  ///</editor-fold>

  // Start Sherbini Zone
  List<ServiceLoaded> servicesLoad = [];

  // End Sherbini Zone

  TextEditingController? offeredServiceController;
  TextEditingController? skillsController;
  TextEditingController? introductionToMeController;
  TextEditingController? languagesController;

  List<int> _offeredServiceIds = [];

  List<int> get offeredServiceIds => _offeredServiceIds;

  void emptyOfferedService() {
    _offeredServiceIds.clear();
    offeredServiceController?.clear();
    update();
  }

  setOfferedServiceId(List<int> offeredServiceIds) {
    _offeredServiceIds = offeredServiceIds;
    update();
  }

  List<String> _offeredServiceTitles = [];

  List<String> get offeredServiceTitles => _offeredServiceTitles;

  List<int> _skillsIds = [];

  List<int> get skillsIds => _skillsIds;

  List<String> _skillsTitles = [];

  List<String> get skillsTitles => _skillsTitles;

  List<int> _languageIds = [];

  List<int> get languageIds => _languageIds;
  final List<String> _languageTitles = [];

  List<String> get languageTitles => _languageTitles;

  void setLanguageIds(List<int> languageIds) {
    _languageIds = languageIds;
    update();
  }

  File? _cv;

  File? get cv => _cv;

  void setCV(File cv) {
    _cv = cv;
    update();
  }

  // void deleteCV ( )   {
  //   _futureCV='';
  //   _cv=null;
  //    _deleteCvCall();
  //   update();
  // }

  String _futureCV = '';

  String get futureCV => _futureCV;
  final DataBase _dataBase = Get.find<DataBase>();

  void _getData() {
    final user = _dataBase.restoreUserModel();
    servicesLoad = [];

    // log("user.services[0].municipalImages.toString()22");
    // log(user.services[0].toString());
    // log(user.services[1].toString());


    if (user.services.isNotEmpty) {
      List<int> servicesIds = [];
      List<String> servicesTitles = [];
      for (var item in user.services) {
        log("item.toJson().toString()");
        log(item.toJson().toString());

        printDM("user services all ${user.services} \n");
        printDM("user services Skills ${user.skills.length} \n ");
        _addFullServiceData(item);
        servicesIds.add(item.id);
        servicesTitles.add(item.title);
      }
      offeredServiceController!.text = servicesTitles.join(' , ');
      _offeredServiceIds = servicesIds;
      _offeredServiceTitles = servicesTitles;

      printDM("_skillsIds in restoreData is $_skillsIds");
      printDM("_skillsTitles in restoreData is $_skillsTitles");

      // Start Sherbini Zone

      // End Sherbini Zone
    }
    if (user.skills.isNotEmpty) {
      List<int> skillsIds = [];
      List<String> skillsTitles = [];
      for (var item in user.skills) {
        skillsIds.add(item.id);
        skillsTitles.add(item.title);
      }
      skillsController!.text = skillsTitles.join(' , ');
      _skillsIds = skillsIds;
      _skillsTitles = skillsTitles;
      printDM("_skillsIds in restoreData is $skillsIds");
      printDM("_skillsTitles in restoreData is $skillsTitles");
    }
    // if(user.languages.isNotEmpty){
    //   List<int> _langIds=[];
    //   List<String> _langTitles=[];
    //     for(var item in user.languages){
    //       _langIds.add(item.id);
    //       _langTitles.add(item.title);
    //     }
    //     languagesController!.text = _langTitles.join(' , ');
    //     _languageIds = _langIds;
    //   _languageTitles = _langTitles;
    //   }
    introductionToMeController!.text = user.about;
    _futureCV = user.cv;
    update();
  }

  /// Service , skills

  // List<String> serviceImages= _dataBase.restoreUserModel().serviceImages;

  /// ****************

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final JumperEmploymentInfoRepository _jumperEmploymentInfoRepository =
      Get.put(JumperEmploymentInfoRepository());
  DataState<UserModel>? dataState = const DataInitial();

  void register() async {
    log("dffdfdf");
    log(municipalRequestImages.toString());
    if (globalKey.currentState!.validate()) {
      if (!isValidServicesImagesRequired) {
        AppSnacks.requestError(error: 'يجب ادراج صور الخدمات');
      } else if (!isValidateMunicipalImageRequired) {
        AppSnacks.requestError(error: 'يجب ادراج صورة البلدية');
      } else {
        globalKey.currentState!.save();
        dataState = const DataLoading();
        update();
        dataState =
            await _jumperEmploymentInfoRepository.enterJumperEmploymentInfo(
          params: JumperEmploymentInfoRequestParams(
            cv: _cv,
            serviceIds: requestServicesIds,
            serviceImages: servicesRequestImages,
            municipalImages: municipalRequestImages,
            skillsIds: _skillsIds,
            // languageIds: languageIds,
            about: introductionToMeController!.text,
          ),
        );
        update();
        if (dataState is DataSuccess) {
          _dataBase.storeUserModel(dataState!.data!);
          // mohammed saleh commented that, and add it when edit only and in entered-bank-account 
          // _dataBase.loginUser();
          if (isEdit) {
            _dataBase.loginUser();
            Get.back();
            AppSnacks.successMessage(message: dataState!.message);
            printDM("EDITTTT");
          } else {
            printDM("NOT EDITTTT");

            Get.offAll( // mohammed saleh edit that
              () => const BankAccountSettingScreen(enteredInLogin: true), // const JumperBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          }
        } else {
          AppSnacks.requestError(
            error: (dataState!.error!.errorTitle != "")
                ? dataState!.error!.errorTitle
                : "Something went wrong",
          );
        }
      }
    }
  }

  void onServiceTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectServiceName(
        onConfirmed: (List<int> id, String value) {
          offeredServiceController!.text = value;
          _offeredServiceIds = id;
        },
      ),
    );
  }

  void onSkillsTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectSkills(onConfirmed: (ids, value) {
        _skillsIds = ids;
        skillsController!.text = value;
      }),
    );
  }

  void onLanguagesTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectLanguages(onConfirmed: (ids, langs) {
        languagesController!.text = langs!;
        _languageIds = ids!;
        printDM("languages controller => ${languagesController!.text}");
      }),
    );
  }

  ///********************** delete cv ***************************
  final DeleteCVRepository _deleteCVRepository = DeleteCVRepository();
  DataState<UserModel> _stateDelete = const DataInitial<UserModel>();

  Future<void> deleteCv() async {
    _stateDelete = const DataLoading();
    update();
    _stateDelete = await (_deleteCVRepository.deleteCV())!;
    DataBase().storeUserModel(_stateDelete.data!);
    update();
    printDM("Done ${_stateDelete.data}");
    Utils.showToast(title: "${_stateDelete.message}", state: UtilState.None);
  }

  @override
  void onInit() {
    super.onInit();
    offeredServiceController = TextEditingController();
    introductionToMeController = TextEditingController();
    skillsController = TextEditingController();
    languagesController = TextEditingController();
    if (isEdit) _getData();
  }

  @override
  void dispose() {
    offeredServiceController?.dispose();
    introductionToMeController?.dispose();
    skillsController?.dispose();
    languagesController?.dispose();
    super.dispose();
  }
}
