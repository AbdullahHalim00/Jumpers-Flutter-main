import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/HomeFeature/bloc/model/company_statics_model.dart';
import 'package:jumper/src/Features/company/HomeFeature/bloc/repo/fetch_company_statics_repo.dart';

class CompanyStaticsController extends GetxController {
  /// ------------------- API CALL -------------------
  DataState<CompanyStaticsModel> _dataState =
      const DataInitial<CompanyStaticsModel>();

  DataState<CompanyStaticsModel> get dataState => _dataState;

  final FetchCompanyStaticsRepository _fetchCompanyStaticsRepository =
      Get.put(FetchCompanyStaticsRepository());

  // Future<void> fetchCompanyStatics() async {
  //   _dataState = const DataLoading<CompanyStaticsModel>();
  //   update();
  //   _dataState= await (_fetchCompanyStaticsRepository.fetchCompanyStatics())!;
  //   update();
  //
  // }

  /// activities layout --------------------------------------
  void showAllActivities() {
    // Get.to(()=>ActivityScreen());
  }

  @override
  void onInit() {
    // fetchCompanyStatics();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
