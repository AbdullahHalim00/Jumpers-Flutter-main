import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/publish_request_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class PublishNowController extends GetxController {
  DataState<bool> state = const DataInitial<bool>();
  final PublishRequestRepo _publishRequestRepo = Get.put(PublishRequestRepo());

  publish(int jobID) async {
    state = const DataLoading();
    update();
    Utils.showLoadingDialog();

    state = await _publishRequestRepo.publish(jobId: jobID)!;
    if (state is DataSuccess) {
      if (state.data == true) {
        Get.off(() => const CompanyBaseScreen());
      }
      if (state.message != null)
        Utils.showToast(title: state.message!, state: UtilState.Success);
    } else {
      AppSnacks.errorMessage();
    }
    Utils.closeDialog();
    update();
  }
}
