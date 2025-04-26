import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Repository/admin_adjective_repo.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';

class AdminAdjectiveController extends GetxController {
  int _adminAdjectiveID = 0;

  int get adminAdjectiveID => _adminAdjectiveID;

  void setAdminAdjectiveID(int value) {
    _adminAdjectiveID = value;
    update();
  }

  String _adminAdjectiveTitle = '';

  String get adminAdjectiveTitle => _adminAdjectiveTitle;

  void setAdminAdjectiveTitle(String value) {
    _adminAdjectiveTitle = value;
    update();
  }

  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final AdminAdjectiveRepository _adminRolesRepository =
      Get.put(AdminAdjectiveRepository());

  Future<void> fetchAdminRoles() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _adminRolesRepository.fetchAdminRoles();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAdminRoles();
    super.onInit();
  }
}
