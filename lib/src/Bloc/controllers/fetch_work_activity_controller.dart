import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Repository/fetch_work_activity_repo.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';

class FetchWorkActivityController extends GetxController {
  int _workActivityID = 0;

  int get workActivityID => _workActivityID;

  void setWorkActivityID(int value) {
    _workActivityID = value;
    update();
  }

  String _workActivityTitle = '';

  String get workActivityTitle => _workActivityTitle;

  void setWorkActivityTitle(String value) {
    _workActivityTitle = value;
    update();
  }

  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final FetchWorkActivityRepository _fetchWorkActivityRepository =
      Get.put(FetchWorkActivityRepository());

  Future<void> fetchWorkActivity() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _fetchWorkActivityRepository.fetchWorkActivity();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchWorkActivity();
    super.onInit();
  }
}
