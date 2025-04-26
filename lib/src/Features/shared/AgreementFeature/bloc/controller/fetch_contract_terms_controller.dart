import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AgreementFeature/bloc/repo/fetch_contract_terms_repo.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/model/terms_privacy_model.dart';

class FetchContractTermsController extends GetxController {
  bool _isTermsAgreed = false;

  bool get isTermsAgreed => _isTermsAgreed;

  // if checked

  final FetchContractTermsRepo _fetchContractTermsRepo =
      Get.put(FetchContractTermsRepo());

  DataState<TermsPrivacyModel> _dataState =
      const DataInitial<TermsPrivacyModel>();

  DataState<TermsPrivacyModel> get dataState => _dataState;

  /// *****************  API CALL  *********************

  void fetchAgreements() async {
    _dataState = const DataLoading();
    update();

    _dataState = await (_fetchContractTermsRepo.fetchAgreement())!;

    update();
  }

  void onAccepted() {
    /// api call
    ///+ then
  }

  void toggleAgreement(bool? newValue) {
    _isTermsAgreed = !_isTermsAgreed;
    update();
  }

  @override
  void onInit() {
    printDM("agreement init ");
    fetchAgreements();
    // TODO: implement onInit
    super.onInit();
  }
}
