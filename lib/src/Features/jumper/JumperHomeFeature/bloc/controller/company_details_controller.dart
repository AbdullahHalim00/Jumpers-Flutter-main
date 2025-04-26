import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/repo/company_details_repo.dart';

class CompanyDetailsController extends GetxController {
  final int companyID;

  CompanyDetailsController(this.companyID);

  DataState<UserModel> _dataState = const DataInitial<UserModel>();

  DataState<UserModel> get dataState => _dataState;

  /// --------------- API CALL ------------------------
  final CompanyDetailsRepository _companyDetailsRepository =
      Get.put(CompanyDetailsRepository());

  Future<void> _fetchInfo() async {
    _dataState = DataLoading();
    update();
    _dataState = await _companyDetailsRepository.fetchCompany(id: companyID)!;
    update();
  }

  @override
  void onInit() {
    _fetchInfo();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
