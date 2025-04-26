import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/services/audio_service.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/fetch_myjobs_controller.dart';
import 'package:jumper/src/Features/company/jobs/bloc/repo/delete_job_request_repo.dart';
import 'package:jumper/src/Features/company/jobs/ui/widgets/imports_widgets_job_screen.dart';

class DeleteJobRequestController extends GetxController {
  /// -------------- API CALLS --------------
  final DeleteJobRequestRepository _deleteJobRequestRepository =
      Get.put(DeleteJobRequestRepository());

  DataState<bool> _dataState = const DataLoading<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> deleteRequest(int id) async {
    bool isDeleted = false;
    Utils.showDialog(
      child: BuildDeleteDialog(
        onAccept: () async {
          Get.back();
          Utils.showLoadingDialog();
          _dataState = const DataLoading();
          update();
          _dataState =
              await (_deleteJobRequestRepository.deleteJob(jobId: id)!);
          isDeleted = _dataState.data!;
          if (Get.isDialogOpen!) Get.back();
          _onDeleteDone(isDeleted, message: _dataState.message ?? "");
          Get.back();
          update();
        },
      ),
    );

    return isDeleted;
  }

  Future<void> _onDeleteDone(bool isDone, {required String message}) async {
    if (isDone) {
      final FetchMyJobsController fetchMyJobsController = Get.find();
      await fetchMyJobsController.fetchJobs();
      Utils.showDefaultSnackBar(
        title: message,
        state: UtilState.Success,
      );
      AppData.applyHapticFeedback(vibration: true);
      AudioService.playDelete();
    }
  }
}
