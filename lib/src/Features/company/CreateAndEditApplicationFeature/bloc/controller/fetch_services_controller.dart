import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/service_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_service_repo.dart';

class FetchServicesController extends GetxController {
  TextEditingController? searchController;

  List<int> get jobServiceIdsSelected => _jobServiceIdsSelected;

  String get selectedValue => _selectedValue;

  List<String> get jobServiceTitles => _jobServiceTitles;

  int get jobServiceIdSelected => _jobServiceIdSelected;

  String _selectedValue = "";
  List<int> _jobServiceIdsSelected = [];
  List<String> _jobServiceTitles = [];
  int _jobServiceIdSelected = 0;
  int _jobServiceIndexSelected = 0;

  int get jobServiceIndexSelected => _jobServiceIndexSelected;

  void setJobServiceIdsSelected(int jobServiceId, String jobServiceTitle) {
    if (_jobServiceIdsSelected.contains(jobServiceId)) {
      _jobServiceIdsSelected.remove(jobServiceId);
      _jobServiceTitles.remove(jobServiceTitle);
      update();
    } else {
      _jobServiceIdsSelected.add(jobServiceId);
      _jobServiceTitles.add(jobServiceTitle);
      update();
    }
    _selectedValue = _jobServiceTitles.join(',');
    update();
  }

  void setSetSelectedSkillsIds(List<int> ids, List<String> titles) {
    _jobServiceIdsSelected = ids;
    _jobServiceTitles = titles;
    update();
  }

  void unSelectSkills(int jobServiceId, String jobServiceTitle) {
    if (_jobServiceIdsSelected.contains(jobServiceId)) {
      _jobServiceIdsSelected.remove(jobServiceId);
      _jobServiceTitles.remove(jobServiceTitle);
    }
    // _jobServiceIdsSelected = [];
    // _jobServiceTitles = [];
    _jobServiceIdSelected = 0;
    _selectedValue = "";
    update();
  }

  void setJobServiceIdSelected(int value) {
    _jobServiceIdSelected = value;

    update();
  }

  void setJobServiceSelected(int value) {
    _jobServiceIndexSelected = value;
    log(services[value].minimumPrice.toString());
    update();
  }

  void setSelectedValue(String value) {
    _selectedValue = value;
    update();
  }

  bool isContain(int id) {
    return _jobServiceIdsSelected.contains(id);
  }

  /// ----------------------- Local Search ---------------------------------------
  final List<ServiceModel> _searchedData = [];

  List<ServiceModel> get searchedData => _searchedData;

  List<ServiceModel> searchLocal(String text) {
    _dataState.data?.forEach((element) {
      if (element.title.contains(text)) {
        _searchedData.add(element);
      }
    });
    return _searchedData;
  }

  /// ----------------------- API CALL ---------------------------------------
  DataState<List<ServiceModel>> _dataState = const DataInitial();

  DataState<List<ServiceModel>> get dataState => _dataState;
  List<ServiceModel> _services = [];

  List<ServiceModel> get services => _services;

  final FetchServicesRepository _fetchServicesRepo =
      Get.put(FetchServicesRepository());

  Future<void> fetchServices() async {
    _dataState = const DataLoading();
    _dataState = (await _fetchServicesRepo.fetchServices())!;
    _services = _dataState.data!;
    update();
  }

  ServiceModel _getServiceById(int id) {
    int index = _services.indexWhere((element) => element.id == id);
    return _services[index];
  }

  List<ServiceModel> getServicesByIds(List<int> ids) {
    List<ServiceModel> serviceLoaded = [];
    for (var element in ids) {
      serviceLoaded.add(_getServiceById(element));
    }
    return serviceLoaded;
  }

  /// -----------------  updates ------------------------

  File? _municipalImage;

  File? get municipalImage => _municipalImage;

  void unSelectImage() {
    _municipalImage = null;
    update();
  }

  void addMunicipalImages() async {
    Utils.showDialog();
    _municipalImage = await Utils.pickImage();
    Utils.closeDialog();
  }

  // ----------------------------------------------------------------------------
  // List<File>? _municipalImages;
  // List<File>? get municipalImages => _municipalImages;
  //
  // List<File>? _serviceImages;
  // List<File>? get serviceImages => _serviceImages;
  //
  // void unSelectImage() {
  //   _municipalImage = null;
  //   update();
  // }
  // void addMunicipalImages() async {
  //   Utils.showDialog();
  //   _municipalImage = await Utils.pickImage();
  //   Utils.closeDialog();
  // }
  //
  // Map<int, Map<String,List<File>>> requestHolder = {
  //   0:{
  //     "municipal_image": _municipalImages,
  //     "service_images": _serviceImages,
  //   },
  // };
  // ----------------------------------------------------------------------------

  @override
  void onInit() {
    fetchServices();
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
