import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/repo/fetch_refusing_reasons_repo.dart';

class FetchRefusingReasonsController extends GetxController {
  int _selectedId = 0;

  int get selectedId => _selectedId;

  void setRefuseIdSelected(int value) {
    _selectedId = value;
    update();
  }

  String _selectedValue = "";

  String get selectedValue => _selectedValue;

  void setSelectedValue(String value) {
    _selectedValue = value;
    update();
  }

  /// ----------------------- API CALL ---------------------------------------
  DataState<List<TitleModel>> _dataState = const DataInitial();

  DataState<List<TitleModel>> get dataState => _dataState;
  final FetchRefusingReasonsRepo _fetchRefusingReasonsRepo =
      Get.put(FetchRefusingReasonsRepo());

  Future<void> fetchReasons() async {
    _dataState = const DataLoading();
    update();

    _dataState = (await _fetchRefusingReasonsRepo.fetchRefusingReasons())!;
    update();
  }

  @override
  void onInit() {
    fetchReasons();
    super.onInit();
  }
}
