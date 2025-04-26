import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_work_time_types_repo.dart';

class FetchWorkTimeTypeController extends GetxController {
  int _selectedId = 0;

  int get selectedId => _selectedId;

  void setSelectedId(int value) {
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
  final FetchWorkTimeTypesRepository _fetchWorkTimeTypeRepo =
      Get.put(FetchWorkTimeTypesRepository());

  Future<void> fetchWorkTimeType() async {
    _dataState = const DataLoading();
    _dataState = (await _fetchWorkTimeTypeRepo.fetchWorkTimeTypes())!;
    update();
  }

  @override
  void onInit() {
    fetchWorkTimeType();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
