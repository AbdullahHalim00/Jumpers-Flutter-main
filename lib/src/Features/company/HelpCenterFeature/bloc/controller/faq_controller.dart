import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/faq_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/HelpCenterFeature/bloc/repo/faq_repo.dart';

class FAQController extends GetxController {
  ///-------------------------- Fetch Data -------------------------------------

  DataState<List<FAQModel>> _dataState = const DataInitial<List<FAQModel>>();

  DataState<List<FAQModel>> get dataState => _dataState;

  final FAQRepo _faqRepo = Get.put(FAQRepo());

  /// Fetched data from Api

  Future<void> fetchFAQ() async {
    _dataState = const DataLoading();
    update();
    _dataState = await (_faqRepo.fetchFAQUs())!;
    update();
  }

  @override
  void onInit() {
    fetchFAQ();
    // TODO: implement onInit
    super.onInit();
  }
}
