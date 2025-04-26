import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/fetch_myjobs_controller.dart';

class SearchJobTileController extends GetxController {
  late TextEditingController searchController;

  final GetStorage _box = GetStorage();

  DataState<List<CompanyJobModel>> _dataState =
      const DataInitial<List<CompanyJobModel>>();

  DataState<List<CompanyJobModel>> get dataState => _dataState;

  final FetchMyJobsController _fetchMyJobsController = Get.find();
  List<CompanyJobModel> _jobsData = [];

  void _getJobs() {
    _jobsData = _fetchMyJobsController.dataState.data ?? [];
  }

  /// current search
  List<CompanyJobModel>? _searchedList = [];

  List<CompanyJobModel>? get searchedList => _searchedList;

  Future<void> onSearchSubmitted(String value) async {
    _dataState = const DataLoading();
    update();
    //-----
    if (value != "") {
      await Future.delayed(const Duration(seconds: 1));
      _searchedList = (_jobsData.where((element) {
        return element.serviceTitle.contains(value);
      }).toList());
    }

    _dataState = DataSuccess(_searchedList ?? []);
    _onSearchedDataFound(value);
    // _displayedName=value;
    // printDM("_displayedName $_displayedName");
    update();
  }

  /// latest search
  List<String> _latestSearches = [];

  List<String> get latestSearches => _latestSearches;

  void _initLatestSearch() {
    _latestSearches = _box.read("latestJobSearch") ?? [];
    printDM("a7med $_latestSearches");
    update();
  }

  void _onSearchedDataFound(String search) {
    if (search != "") {
      if (!_latestSearches.contains(search)) {
        _latestSearches.add(search);
        _saveLatestSearch();
      }
    }
  }

  void _saveLatestSearch() {
    _box.write("latestJobSearch", _latestSearches);
  }

  void clearAllLatestSearches() {
    _latestSearches = [];
    _box.remove("latestJobSearch");
    update();
  }

  void removeLatestSearch(String valueSearched) {
    _latestSearches.removeWhere((element) => element == valueSearched);
    _saveLatestSearch();
    update();
  }

  @override
  void onInit() {
    _initLatestSearch();
    _getJobs();
    searchController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
