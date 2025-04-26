import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Repository/fetch_identities_repo.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';

class FetchIdentitiesController extends GetxController {
  int _identityID = 0;

  int get identityID => _identityID;

  void setIdentitiesID(int value) {
    _identityID = value;
    update();
  }

  String _identityTitle = '';

  String get identityTitle => _identityTitle;

  void setIdentitiesTitle(String value) {
    _identityTitle = value;
    update();
  }

  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final FetchIdentitiesRepository _fetchIdentitiesRepository =
      Get.put(FetchIdentitiesRepository());

  Future<void> fetchIdentities() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _fetchIdentitiesRepository.fetchIdentities();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchIdentities();
    super.onInit();
  }
}
