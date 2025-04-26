import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_work_time_types_repo.dart';

class FetchWorkTimeTypesController extends GetxController {
  int _idSelected = 0;

  int get idSelected => _idSelected;

  void setId(int value) {
    _idSelected = value;
    update();
  }

  String _titleSelected = '';

  String get titleSelected => _titleSelected;

  void setTitle(String value) {
    _titleSelected = value;
    update();
  }

  final FetchWorkTimeTypesRepository _fetchWorkTimeTypesRepository =
      Get.put(FetchWorkTimeTypesRepository());

  /// ----------------------- API CALL ---------------------------------------
  DataState<List<TitleModel>>? dataState = const DataInitial();

  Future<void> fetchSkills() async {
    dataState = const DataLoading();
    update();
    dataState = await _fetchWorkTimeTypesRepository.fetchWorkTimeTypes();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchSkills();
    super.onInit();
  }

  /// ----------------------- API CALL --------------------------
}
