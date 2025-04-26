import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Repository/fetch_cities_repo.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';

class FetchCitiesController extends GetxController {
  int _cityID = 0;

  int get cityID => _cityID;

  void setCityID(int value) {
    _cityID = value;
    update();
  }

  String _cityTitle = '';

  String get cityTitle => _cityTitle;

  void setCityTitle(String value) {
    _cityTitle = value;
    update();
  }

  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final FetchCitiesRepository _fetchCitiesRepository =
      Get.put(FetchCitiesRepository());

  Future<void> fetchCities() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _fetchCitiesRepository.fetchCities();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCities();
    super.onInit();
  }
}
