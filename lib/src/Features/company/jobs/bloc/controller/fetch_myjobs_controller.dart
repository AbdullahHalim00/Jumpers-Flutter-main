import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/screens/imports_create_new_application.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/delete_job_request_controller.dart';
import 'package:jumper/src/Features/company/jobs/bloc/repo/fetch_myjobs_repo.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';

class FetchMyJobsController extends GetxController {
  /// ------------------------------
  int _index = 0;

  int get index => _index;

  // RequestStatus status = RequestStatus.done;
  void changeView(int newIndex) {
    _index = newIndex;
    update();
  }

  void addJob() {
    Get.to(() => const CreateJobApplicationScreen());
  }

  /// ------------------------------

  List<CompanyJobModel> _allJobs = [];

  List<CompanyJobModel> get allJobs => _allJobs
      .where((element) => element.status != ApplicationStatus.underWay)
      .toList();

  List<CompanyJobModel> get newJobs => _newJobs;
  List<CompanyJobModel> _canceledJobs = [];
  List<CompanyJobModel> _reviewingJobs = [];
  List<CompanyJobModel> _pendingJobs = [];
  List<CompanyJobModel> _underwayJobs = [];
  List<CompanyJobModel> _unCompletedJobs = [];
  List<CompanyJobModel> _completedJobs = [];
  List<CompanyJobModel> _newJobs = [];

  List<CompanyJobModel> get canceledJobs => _canceledJobs;

  List<CompanyJobModel> get reviewingJobs => _reviewingJobs;

  List<CompanyJobModel> get pendingJobs => _pendingJobs;

  List<CompanyJobModel> get underwayJobs => _underwayJobs;

  List<CompanyJobModel> get completedJobs => _completedJobs;

  List<CompanyJobModel> get unCompletedJobs => _unCompletedJobs;

  void _emptyJobLists() {
    _allJobs = [];
    _canceledJobs = [];
    _reviewingJobs = [];
    _pendingJobs = [];
    _underwayJobs = [];
    _unCompletedJobs = [];
    _completedJobs = [];
    _newJobs = [];
  }

  /// -------------- API CAll ----------------
  DataState<List<CompanyJobModel>> _dataState = const DataInitial();

  DataState<List<CompanyJobModel>> get dataState => _dataState;
  final FetchMyJobsRepository _fetchMyJobsRepository =
      Get.put(FetchMyJobsRepository());

  Future<void> fetchJobs() async {
    _dataState = const DataLoading();
    update();
    _dataState = (await _fetchMyJobsRepository.fetchMyJobs())!;
    _fillJobLists(_dataState.data ?? []);
    update();
  }

  void _fillJobLists(List<CompanyJobModel> model) {
    _emptyJobLists();
    _allJobs = model;
    for (var element in _allJobs) {
      if (element.status == ApplicationStatus.newRequest) {
        _newJobs.add(element);
      } else if (element.status == ApplicationStatus.reviewing) {
        _reviewingJobs.add(element);
      } else if (element.status == ApplicationStatus.pending) {
        _pendingJobs.add(element);
      } else if (element.status == ApplicationStatus.underWay) {
        _underwayJobs.add(element);
      } else if (element.status == ApplicationStatus.uncompleted) {
        _unCompletedJobs.add(element);
      } else if (element.status == ApplicationStatus.completed) {
        _completedJobs.add(element);
      } else {
        _canceledJobs.add(element);
      }
    }
  }

  /// ------------DELETE -----------
  final DeleteJobRequestController _deleteController =
      Get.put(DeleteJobRequestController());

  deleteJobRequest(int id) {
    _deleteController.deleteRequest(id).then((value) {
      if (value) {
        _updateAfterDelete(id);
      }
    });
  }

  _updateAfterDelete(int deletedJobID) {
    _dataState = const DataLoading();
    update();
    _allJobs.removeWhere(
      (element) => element.id == deletedJobID,
    );
    _fillJobLists(_allJobs);
    Future.delayed(const Duration(seconds: 1), () {
      _dataState = DataSuccess(_allJobs);
      update();
    });
  }

  updateAfterEdit(int jobId, CompanyJobModel jobModel) {
    _dataState = const DataLoading();
    update();
    int index = _allJobs.indexWhere((element) => element.id == jobId);
    _allJobs.removeAt(index);
    _allJobs.insert(index, jobModel);
    Future.delayed(const Duration(seconds: 1), () {
      _dataState = DataSuccess(_allJobs);
      update();
    });
  }

  // void _updateListsAfterDelete (List<JobModel> model,{required int deletedID}){
  //   _fillJobLists(model);
  //
  //   _allJobs = model;
  //   for (var element in model) {
  //     if (element.status == ApplicationCardStatus.newRequest) {
  //       _newJobs.add(element);
  //     } else if (element.status == ApplicationCardStatus.reviewing) {
  //       _reviewingJobs.add(element);
  //     } else if (element.status == ApplicationCardStatus.pending) {
  //       _pendingJobs.add(element);
  //     }
  //     else if (element.status == ApplicationCardStatus.underWay) {
  //       _underwayJobs.add(element);
  //     }
  //     else if (element.status == ApplicationCardStatus.uncompleted) {
  //       _unCompletedJobs.add(element);
  //     }  else if (element.status == ApplicationCardStatus.completed) {
  //       _completedJobs.add(element);
  //     }
  //     else {
  //       _canceledJobs.add(element);
  //     }
  //   }
  // }
  /// ------------------------------

  @override
  void onInit() {
    fetchJobs();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
