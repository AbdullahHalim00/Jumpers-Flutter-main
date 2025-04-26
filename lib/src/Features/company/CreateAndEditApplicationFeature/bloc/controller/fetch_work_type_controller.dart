import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/params/fetch_work_type_params.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_work_type_repo.dart';

class FetchWorkTypeController extends GetxController {
  String _workTypeTitle = '';

  String get workTypeTitle => _workTypeTitle;

  void setWorkTypeTitle(String value) {
    _workTypeTitle = value;
    update();
  }

  int _workTypeId = 0;

  int get workTypeId => _workTypeId;

  void setWorkTypeId(int value) {
    _workTypeId = value;
    update();
  }

  /// ----------------------- API CALL --------------------------
  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final FetchWorkTypeRepository _fetchWorkTypeRepository =
      Get.put(FetchWorkTypeRepository());

  Future<void> fetchAddJobInfo(
      {required FetchWorkTypeParameters parameters}) async {
    _dataState = const DataLoading();
    update();
    _dataState =
        await _fetchWorkTypeRepository.fetchWorkType(parameters: parameters);
    update();
  }
}
