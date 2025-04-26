import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/model/terms_privacy_model.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/repo/terms_repo.dart';

class TermsController extends GetxController {
  final TermsRepo _privacyRepo = Get.put(TermsRepo());

  DataState<TermsPrivacyModel> _dataState =
      const DataInitial<TermsPrivacyModel>();

  DataState<TermsPrivacyModel> get dataState => _dataState;

  /// Fetched data from Api

  Future<void> fetchTerms() async {
    _dataState = const DataLoading();
    update();
    _dataState = await (_privacyRepo.fetchTerms())!;
    update();
  }

  @override
  void onInit() {
    fetchTerms();
    // TODO: implement onInit
    super.onInit();
  }
}
