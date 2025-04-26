import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumper/src/Bloc/models/JobActivityResponse.dart';
import 'package:jumper/src/Bloc/models/MessageResponse.dart';
import 'package:jumper/src/Bloc/models/jumper_job_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/repo/jumper_jobs_repo.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';

import '../../../../../Bloc/models/JobDetailsResponse.dart';
import '../../../../../Core/utils/storage_util.dart';

class JumperJobsController extends GetxController {
  /// +++++++++++++++++ auto call requests  +++++++++++++++++++
  // late Timer _timer ;
  // void autoCall (){
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     fetchJobs();
  //   });
  // }
  /// +++++++++++++++++ auto call requests  +++++++++++++++++++

  DataState<JumperJobModel> _dataState = const DataInitial<JumperJobModel>();

  DataState<JumperJobModel> get dataState => _dataState;

  final JumperJobsRepository _jobEmployeesRepository =
      Get.put(JumperJobsRepository());

  JobDetailsResponse? jobDetailsResponse;
  JobActivityResponse? jobActivityResponse;
  DataBase dataBase = DataBase();

  List<JumperJob> _jobs = [];
  List<JumperJob> _myJobs = [];

  List<JumperJob> get jobs => _jobs;

  List<JumperJob> get myJobs => _myJobs
      .where((element) => element.status != ApplicationStatus.underWay)
      .toList();

  List<JumperJob> get allMyJobs =>
      _myJobs.where((element) => element.status != 4).toList();

  List<JumperJob> get myCurrentJobs =>
      _myJobs.where((element) => element.status == 4).toList();
  final DataBase _dataBase = Get.find<DataBase>();

  // List <JumperJob>_jobSnip = [];
  // List<JumperJob> get jobSnip => _jobSnip;

  void _fillLists(JumperJobModel model) {
    _jobs = model.jobs;
    // final expiry = model.jobs.sort((a,b)=>a.publishedAt.compareTo(b.publishedAt));
    // DateTime expiryAsDateTime = DateTime.parse(expiry);
    // _jobSnip=
    _myJobs = model.myJobs;
  }

  /// --------------- API CALL ------------------------
  bool get isEmployeeTabEmpty {
    return (_myJobs.isEmpty && _jobs.isEmpty);
  }

  Future<void> fetchJobs() async {
    _dataState = const DataLoading();
    update();
    _dataState = await (_jobEmployeesRepository.fetchMyJobs())!;
    if (_dataState.data != null) {
      _fillLists(_dataState.data!);
    }

    update();
  }

  LatLng? myLocation;
  bool isLoading = false;

  getUserLocation(String id, int type) async {
    isLoading = true;
    update();
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          Get.showSnackbar(GetSnackBar(
            duration: Duration(seconds: 4),
            message: 'please trun on your GPS',
            backgroundColor: Colors.red,
          ));
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 4),
          message: 'please trun on your GPS',
          backgroundColor: Colors.red,
        ));
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition();
      this.myLocation = LatLng(position.latitude, position.longitude);
      if (myLocation != null) {
        attend(id, type);
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 4),
          message: 'please trun on your GPS',
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 4),
        message: 'please trun on your GPS',
        backgroundColor: Colors.red,
      ));
      log(e.toString());
    }
    isLoading = false;
    update();
  }

  attend(String job_id, int type) async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    // log(_dataBase.restoreUserModel().apiToken);
    log(job_id);
    try {
      var response = await dioNew.post(
          'https://jumpersksa.com/api/${type == 0 ? 'departure-job' : 'attendees-job'}',
          data: {
            "job_id": job_id,
            "lat": myLocation!.latitude.toString(),
            "lng": myLocation!.longitude.toString(),
          });
      log("${response.data}");
      MessageResponse messageResponse = MessageResponse.fromJson(response.data);
      if (messageResponse.status.toString() == "200") {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          message: messageResponse.message,
          backgroundColor: Colors.green,
        ));
        jobDetailsResponse = null;
        getJobDetails(job_id);
        jobActivityResponse = null;
        getJobActivity(job_id);
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 4),
          message: messageResponse.message,
          backgroundColor: Colors.red,
        ));
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    update();
  }

  getJobActivity(String job_id) async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    // log(_dataBase.restoreUserModel().apiToken);
    log(job_id);
    try {
      var response = await dioNew.post(
          'https://jumpersksa.com/api/departure-attendees-history',
          data: {
            "job_id": job_id,
          });
      log("${response.data}");
      jobActivityResponse = JobActivityResponse.fromJson(response.data);
      if (jobActivityResponse!.status.toString() == "200") {
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }
    update();
  }

  getJobDetails(String job_id) async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    log(_dataBase.restoreUserModel().apiToken);
    log("HUNT" + job_id);
    try {
      var response =
          await dioNew.post('https://jumpersksa.com/api/job_details', data: {
        "job_id": job_id,
      });
      log("${response.data}");
      jobDetailsResponse = JobDetailsResponse.fromJson(response.data);
      if (jobDetailsResponse!.status.toString() == "200") {
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    fetchJobs();

    // autoCall();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
