import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/model/terms_privacy_model.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/repo/privacy_repo.dart';

class PrivacyController extends GetxController {
  final PrivacyRepo _privacyRepo = Get.put(PrivacyRepo());

  DataState<TermsPrivacyModel> _dataState =
      const DataInitial<TermsPrivacyModel>();

  DataState<TermsPrivacyModel> get dataState => _dataState;

  /// Fetched data from Api

  Future<void> fetchPrivacy() async {
    _dataState = const DataLoading();
    update();
    _dataState = await (_privacyRepo.fetchPrivacy())!;
    update();
  }

  @override
  void onInit() {
    fetchPrivacy();
    // TODO: implement onInit
    super.onInit();
  }
}
