import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/model/add_jop_info_model.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_add_jop_info_repo.dart';

class FetchAddJobInfoController extends GetxController {
  //<editor-fold desc="AccountType">

  String _accountTypeTitle = '';

  String get accountTypeTitle => _accountTypeTitle;

  void setAccountTypeTitle(String value) {
    _accountTypeTitle = value;
    update();
  }

  int _accountTypeId = 0;
  int _accountTypeCost = 0;

  int get accountTypeCost => _accountTypeCost;

  void setAccountTypeCost(int value) {
    _accountTypeCost = value;
    update();
  }

  int get accountTypeId => _accountTypeId;

  void setAccountTypeId(int value) {
    _accountTypeId = value;
    update();
  }

  //</editor-fold>

  String _workDurationTitle = '';

  String get workDurationTitle => _workDurationTitle;

  void setWorkDurationTitle(String value) {
    _workDurationTitle = value;
    update();
  }

  int _workDurationId = 0;

  int get workDurationId => _workDurationId;

  void setWorkDurationId(int value) {
    _workDurationId = value;
    update();
  }

  String _timeTypeTitle = '';

  String get timeTypeTitle => _timeTypeTitle;

  void setTimeTypeTitle(String value) {
    _timeTypeTitle = value;
    update();
  }

  int _timeTypeId = 0;

  int get timeTypeId => _timeTypeId;

  void setTimeTypeId(int value) {
    _timeTypeId = value;
    update();
  }

  String _priceTypeTitle = '';

  String get priceTypeTitle => _priceTypeTitle;

  void setPriceTypeTitle(String value) {
    _priceTypeTitle = value;
    update();
  }

  int _priceTypeId = 0;

  int get priceTypeId => _priceTypeId;

  void setPriceTypeId(int value) {
    _priceTypeId = value;
    update();
  }

  /// ----------------------- API CALL --------------------------
  DataState<AddJopInfoModel>? _dataState = const DataInitial();

  DataState<AddJopInfoModel>? get dataState => _dataState;
  final FetchAddJobInfoRepository _fetchAddJobInfoRepository =
      Get.put(FetchAddJobInfoRepository());

  Future<void> fetchAddJobInfo() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _fetchAddJobInfoRepository.fetchAddJobInfo();
    update();
  }

  @override
  void onInit() {
    fetchAddJobInfo();
    // TODO: implement onInit
    super.onInit();
  }
}
