import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_shapes.dart';
import 'package:jumper/src/Core/constants/strings/app_strings.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/geolocation_services.dart';
import 'package:jumper/src/Core/utils/date_utilities.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/model/gender_model.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/params/add_job_params.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/add_job_repo.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/screens/imports_create_new_application.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/widgets/dialog_add_job_successfully.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/widgets/imports_widget_create_new_application.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/ui/widgets/sheet_select_age.dart';
import 'package:jumper/src/Features/company/MapFeature/ui/screen/imports_map_screen.dart';
import 'package:jumper/src/Features/company/job_details/ui/screens/imports_job_details_screen.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/fetch_myjobs_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/BottomSheets/account_type_bottom_sheet.dart';
import 'package:jumper/src/Ui/BottomSheet/BottomSheets/work_time_type_bottom_sheet.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/sheets/date_picker_sheet.dart';
import 'package:jumper/src/Ui/sheets/time_picker_sheet.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../Ui/BottomSheet/BottomSheets/cities_bottom_sheet.dart';

class AddJobController extends GetxController {
  final bool isEdit;
  final CompanyJobModel? jobModel;

  AddJobController({this.isEdit = false, this.jobModel});

  /// SCREEN 1
  /// ------------------------------------------------------------------------
  /// ------------------------------------------------------------------------
  /// ------------------------------------------------------------------------
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey1 => _formKey1;
  TextEditingController? serviceNameController;
  TextEditingController? jumpersController;
  TextEditingController? nationalityController;
  TextEditingController? genderController;
  TextEditingController? numOfMalesController;
  TextEditingController? numOfFeMalesController;
  TextEditingController? skillsController;
  TextEditingController? ageFromController;
  TextEditingController? ageToController;
  TextEditingController? ageController;
  TextEditingController? workTimeTypeController;
  TextEditingController? languagesController;
  TextEditingController? detailedAddressController;
  TextEditingController? workLocationController;
  bool _isProceedButtonDisabled = true;
  TextEditingController? cityController;

  bool get isProceedButtonDisabled => _isProceedButtonDisabled;

  // **** ------------------ service controller ------------------ *****
  int _serviceId = 0;

  int get serviceId => _serviceId;

  final FetchMyJobsController _fetchMyJobsController =
      Get.put(FetchMyJobsController());

  void onServiceTapped() {
    // FetchWorkTypeController _fetchWorkTypeController =
    //     Get.put(FetchWorkTypeController());
    AppSheet.showDefaultSheet(
      SheetSelectSingleServiceName(
        onConfirmed: (int id, String value) {
          serviceNameController?.text = value;
          _serviceId = id;
          // _fetchWorkTypeController.fetchAddJobInfo(parameters: FetchWorkTypeParameters(serviceId: id));
        },
      ),
    );
  }

  int _cityId = 0;

  int get cityId => _cityId;

  void setCityId(int cityId) {
    _cityId = cityId;
    update();
  }

  void openCitySheet() {
    AppSheet.showDefaultSheet(CitiesBottomSheet(onSave: (id, title) {
      printDM("title selected is $title");
      cityController!.text = title;
      setCityId(id);
    }));
  }

  // **** ------------------ Jumper controller ------------------ *****
  int _jumperNumbers = 0;

  int get jumperNumbers => _jumperNumbers;

  // **** ------------------ Nationality controller ------------------*****

  int _nationalityId = 2;

  int get nationalityId => _nationalityId;

  void onNationalityTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectNationality(
        id: _nationalityId,
        onSaved: (id, value) {
          nationalityController?.text = value;
          _nationalityId = id;
          printDM("_nationalityId $_nationalityId");
        },
      ),
    );
  }

  // **** ------------------ Gender controller ------------------*****
  int _genderId = 4;

  int get genderId => _genderId;

  void onGenderTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectGender(
        id: _genderId,
        onSaved: (id, value) {
          genderController?.text = value;
          _genderId = id;
          printDM("genderId $_genderId");
        },
      ),
    );
  }

  // **** ------------------  Age controller ------------------*****

  int _initialAgeFrom = 18;

  int get initialAgeFrom => _initialAgeFrom;

  void setInitialAgeFrom(int value) {
    _initialAgeFrom = value;
    update();
  }

  int _initialAgeTo = 81;

  int get initialAgeTo => _initialAgeTo;

  void setInitialAgeTo(int value) {
    _initialAgeTo = value;
    update();
  }

  void onAgeTapped(BuildContext context) {
    AppSheet.showDefaultSheet(
      SheetSelectAge(
        onSavePress: (from, to) {
          ageFromController!.text = "$from";
          ageToController!.text = "$to";
          if (from == to) {
            ageController!.text = "$from";
          } else {
            ageController!.text = "$from : $to";
            printDM(ageController!.text);
          }
        },
      ),
    );
    // Get.bottomSheet(
    //   AdaptivePicker.cupertinoDatePicker(
    //     context,
    //     title: "date_of_birth".tr,
    //     onConfirmLabel: "save".tr,
    //     initial: nowDate,
    //     minimumYear: nowDate
    //         .subtract(const Duration(days: _year * 150))
    //         .year,
    //     minDate: nowDate.subtract(const Duration(days: _year * 150)),
    //     maxDate: nowDate.add(const Duration(days: 0)),
    //     maximumYear: nowDate.year,
    //     onConfirm: (ageText) {
    //       if (ageText != null) {
    //         ageController?.text = DateUtilities.calculateAge(ageText);
    //       }
    //     },
    //   ),
    // );
  }

  // **** ------------------  skills controller ------------------*****

  List<int> _skillIds = [];

  List<int> get skillIds => _skillIds;

  List<String> _skillTitles = [];

  List<String> get skillTitles => _skillTitles;

  void onSkillsTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectSkills(onConfirmed: (ids, value) {
        skillsController!.text = value;
        _skillIds = ids;
        // printDM("Skills =>${}");
      }),
    );
  }

  // **** ------------------ languages controller ------------------*****

  List<int> _lanIds = [];

  List<int> get lanIds => _lanIds;
  List<String> _lanTitles = [];

  List<String> get lanTitles => _lanTitles;

  void onLanguagesTapped() {
    AppSheet.showDefaultSheet(
      SheetSelectLanguages(onConfirmed: (ids, langs) {
        languagesController!.text = langs!;
        _lanIds = ids!;
        printDM("languages controller => ${languagesController!.text}");
      }),
    );
  }

  // int _workTypeId = 0;
  //
  // void selectWorkType() {
  //   if (serviceId == 0) {
  //     AppSnacks.requestError(error: 'must_select_service_name_first'.tr);
  //   } else {
  //     AppSheet.showDefaultSheet(
  //       WorkTypeBottomSheet(onSave: (id, title) {
  //         workTypeController!.text = title;
  //         _workTypeId = id;
  //       }),
  //     );
  //   }
  // }

  double? _lat;

  double? _lon;

  Future<void> getLocation() async {
    final locationResponse = await GeolocationServices().determinePosition();
    _lat = locationResponse!.position!.latitude;
    _lon = locationResponse.position!.longitude;
    printDM("_lat in add is $_lat");
    printDM("_lon in add is $_lon");
    update();
  }

  void moveToMap() {
    if (_lat == null) {
      getLocation().then((value) => Get.to(
            () => MapScreen(
              currentPosition: LatLng(_lat!, _lon!),
              onSave: (address, latLon) {
                workLocationController!.text = address;
                _lat = latLon.latitude;
                _lon = latLon.longitude;
                printDM('_lat in add is $_lat');
                printDM('_lon in controller id $_lon');
                update();
              },
            ),
          ));
    } else {
      Get.to(
        () => MapScreen(
          currentPosition: LatLng(_lat!, _lon!),
          onSave: (address, latLon) {
            workLocationController!.text = address;
            _lat = latLon.latitude;
            _lon = latLon.longitude;
            printDM('_lat in add is $_lat');
            printDM('_lon in controller id $_lon');
            update();
          },
        ),
      );
    }
  }

  // **** ------------------ work Address controller ------------------*****
  void setWorkAddress(String address) {
    workLocationController!.text = address;
  }

  /// **** ------------------ details controller ------------------*****

  void completeApplication() {
    accountTypeController?.text= "";
    workContractDurationController?.text= "";
    workTimesController?.text= "";
    startDateController?.text= "";
    endDateController?.text= "";
    workStartTimeController?.text= "";
    workEndTimeController?.text= "";
    workTypeController?.text= "";
    costController?.text= "";
    totalCostController?.text= "";
    jobDescriptionController?.text= "";
    Get.to(() => CompleteApplicationScreen(
          isEdit: isEdit,
        ));
  }

  /// SCREEN 2
  /// ------------------------------------------------------------------------
  /// ------------------------------------------------------------------------
  /// ------------------------------------------------------------------------
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey2 => _formKey2;
  TextEditingController? accountTypeController;
  TextEditingController? workContractDurationController;
  TextEditingController? workTimesController;
  TextEditingController? startDateController;
  TextEditingController? endDateController;
  TextEditingController? workStartTimeController;
  TextEditingController? workEndTimeController;
  TextEditingController? workTypeController;
  TextEditingController? costController;
  TextEditingController? totalCostController;
  TextEditingController? jobDescriptionController;
  bool _isPublishButtonDisabled = true;

  bool get isPublishButtonDisabled => _isPublishButtonDisabled;
  bool _isPennedButtonDisabled = true;

  bool get isPennedButtonDisabled => _isPennedButtonDisabled;

  int _accountTypeId = 0;

  int get accountTypeId => _accountTypeId;

  void selectAccountType() {
    AppSheet.showDefaultSheet(
      AccountTypeBottomSheet(
        onSave: (id, title, cost) {
          accountTypeController!.text = title;
          _minimumCost = cost;
          printDM("Minimum cost =>$_minimumCost");
          _accountTypeId = id;
          _workStartTime = "";
          _workEndTime = '';
          workStartTimeController!.clear();
          workEndTimeController!.clear();
          _startTimeFullFormat = DateTime.now();
          _endTimeFullFormat = DateTime.now();
          update();
        },
      ),
    );
  }

  // final DateTime _minumumDate = DateTime.now();
  DateTime _startDateFullFormat = DateTime.now();
  DateTime _endDateFullFormat = DateTime.now();

  void pickStartDate() {
    Get.bottomSheet(
      DatePickerSheet(
        init: _startDateFullFormat,
        title: "start_date".tr,
        onConfirmed: (startDate) {
          if (startDate != null) {
            _startDateFullFormat = startDate;
            printDM("date select is $startDate");
            startDateController?.text =
                DateUtilities.convertDateToYMD(startDate);
          }
        },
      ),
    );
    calcWorkPeriodAuto();
  }

  void pickEndDate() {
    Get.bottomSheet(
      DatePickerSheet(
        init: _endDateFullFormat,
        title: "end_date".tr,
        onConfirmed: (endDate) {
          if (endDate != null) {
            _endDateFullFormat = endDate;
            endDateController?.text = DateUtilities.convertDateToYMD(endDate);
          }
        },
      ),
    );
    calcWorkPeriodAuto();
  }

  // **** ------------------  work time type controller ------------------*****

  RxInt _workTimeType = 0.obs;

  RxInt get workTimeType => _workTimeType;

  void onWorkTimeTypeTapped() {
    AppSheet.showDefaultSheet(
      WorkTimeTypeBottomSheet(onSave: (id, title) {
        workTimeTypeController?.text = title;
        _workTimeType.value = id;

        update();
      }),
    );
  }

  String _workStartTime = '';
  String _workEndTime = '';
  DateTime _startTimeFullFormat = DateTime.now();
  DateTime _endTimeFullFormat = DateTime.now();

  void pickStartTime() {
    if (_accountTypeId == 0) {
      AppSnacks.requestError(error: 'must_select_account_type_first'.tr);
    } else {
      Get.bottomSheet(
        TimePickerSheet(
          initial: _startTimeFullFormat,
          title: "work_start_time".tr,
          onConfirm: (DateTime? date) {
            if (date != null) {
              printDM("date select is $date");
              _startTimeFullFormat = date;
              _endTimeFullFormat = date.add(Duration(
                  hours: int.parse(accountTypeController!.text[0].toString())));
              workStartTimeController!.text =
                  DateUtilities.convertDateToTime(date);
              _workStartTime = DateUtilities.convertDateToTime24(date);
              workEndTimeController!.text =
                  DateUtilities.convertDateToTimeAndAddHours(date,
                      int.parse(accountTypeController!.text[0].toString()));
              _workEndTime = DateUtilities.convertDateToTimeAndAddHours24(
                  date, int.parse(accountTypeController!.text[0].toString()));
              printDM("date selected is ${workStartTimeController!.text}");
            }
          },
        ),
        shape: AppShapes.bottomSheetShape,
      );
    }
  }

  // void pickEndTime() {
  //   Get.bottomSheet(
  //     TimePickerSheet(
  //       title: "work_end_time".tr,
  //       onConfirm: (DateTime? date) {
  //         if (date != null) {
  //           workEndTimeController!.text = DateUtilities.convertDateToTime(date);
  //         }
  //       },
  //     ),
  //     shape: AppShapes.bottomSheetShape,
  //   );
  // }

  List<String> _daysSelected = [];
  List<DateTime> _daysSelectedConverted = [];

  void openDatePicker() {
    printDM('taaaaaaap');
    Get.dialog(
      DatePickerMultipleWidget(
        daysSelected: _daysSelectedConverted,
        onSubmit: (dynamic val) {
          if (val != null) {
            printDM('step 2');
            _daysSelectedConverted.clear();
            _daysSelected.clear();
            for (var item in val) {
              _daysSelected
                  .add(DateFormat('yyyy/MM/dd').format(item).toString());
              _daysSelectedConverted.add(item);
            }
            printDM('step 3 $_daysSelected');
            workTimesController!.text = _daysSelected.join(',').toString();
            startDateController!.text =
                workTimesController!.text.split(' , ').first;
            endDateController!.text =
                workTimesController!.text.split(' , ').last;

            printDM("startDateController is ${startDateController!.text}");
            printDM("endDateController is ${endDateController!.text}");

            workContractDurationController!.text =
                DateUtilities.convertDurationToDay(_daysSelected.length);
            update();
            Get.back();
          }
        },
      ),
    );
  }

  // int _priceTypeId = 0;
  //
  // void onPriceTypeTapped() {
  //   AppSheet.showDefaultSheet(
  //     PriceTypeBottomSheet(onSave: (id, title) {
  //       perCostController?.text = title;
  //       _priceTypeId = id;
  //     }),
  //   );
  // }

  int _days = 0;

  void calcWorkPeriodAuto() {
    _workTimeType.listen((value) {
      workContractDurationController?.text = "";
      startDateController?.clear();
      endDateController?.clear();
      _endDateFullFormat = DateTime.now();
      _startDateFullFormat = DateTime.now();
      _days = 0;
    });
    if (_days is int && _days > 0) {
      _days = _days;
    } else {
      _days = 0;
    }
    try {
      _days = int.parse(workContractDurationController?.text ?? "0");
    } catch (e) {
      _days = 0;
    }

    try {
      final date1 = DateTime.parse(startDateController!.text);
      final date2 = date1.add(
          _days == 0 ? const Duration(days: 1) : Duration(days: _days - 1));
      endDateController!.text = DateUtilities.convertDateToYMD(date2);
    } catch (e) {
      printDM(e.toString());
    }

    // endDateController?.addListener(() {
    //   if (startDateController!.text.isNotEmpty &&
    //       endDateController!.text.isNotEmpty) {
    //     final date1 = DateTime.parse(startDateController!.text);
    //     final date2 = DateTime.parse(endDateController!.text);
    //     final difference = date2.difference(date1).inDays;
    //     if (difference >= 0) {
    //       workContractDurationController!.text =
    //           DateUtilities.convertDurationToDay(difference);
    //       _days = difference;
    //       printDM("_days is $_days");
    //       calcTotalCost();
    //     } else {
    //       Utils.showToast(
    //         title: "work_contract_duration_caution".tr,
    //         state: UtilState.Error,
    //       );
    //       endDateController?.removeListener(() {});
    //     }
    //   }
    // });

    update();
  }

  int _minimumCost = 0;

  bool checkCost() {
    final cost = int.tryParse(costController?.text ?? "0");
    if (cost! < _minimumCost) {
      // lower than 2$ for example
      // Utils.showDialog(child: const BuildLowCostCautionDialog());
      return false;
    } else {
      return true;
    }
  }

  calcTotalCost() {
    final price = int.tryParse(costController?.text ?? "0");
    final jumpers = int.tryParse(jumpersController?.text ?? "0");
    final total = (price ?? 0) * (jumpers ?? 1) * (_days);
    totalCostController?.text = total.toString();
    printDM(
        '........ price is $price jumpers $jumpers days $_days +++> TOTAL ${totalCostController?.text}');
  }

  calculateTotalCost() {
    accountTypeController?.addListener(() {
      calcTotalCost();
      update();
    });
    jumpersController?.addListener(() {
      calcTotalCost();
      update();
    });

    // workTimeTypeController?.addListener(() {
    //   calcTotalCost();
    //   update();
    // });
    // startDateController?.addListener(() {
    //   calcTotalCost();
    //   update();
    // });
    workContractDurationController?.addListener(() {
      calcTotalCost();
      update();
    });
    accountTypeController?.dispose();
    jumpersController?.dispose();
    workTimeTypeController?.dispose();
  }

  void _showPennedDialog() =>
      Utils.showDialog(child: const BuildSaveJobToPendedDialog());

  ///---------------------- AP CALL -------------------------

  final FetchMyJobsController _myJobsController = Get.find();

  /// ------------------------ ADD JOB ----------------------------
  final AddJobRepository _addJobRepository = Get.put(AddJobRepository());
  DataState<CompanyJobModel>? _dataState = const DataInitial();

  DataState<CompanyJobModel>? get dataState => _dataState;

  void sendRequest({required int requestStatus, int? type}) async {
    if (checkCost()) {
      _dataState = const DataLoading();
      update();
      Utils.showLoadingDialog();

      printDM("Add CAN PROCEED");
      _dataState = await _addJobRepository.addJob(
        parameters: AddJobParameters(
          cityId: cityId,
          jobId: isEdit ? jobModel!.id : null,
          serviceId: _serviceId,
          jumPerNumbers: int.parse(jumpersController!.text),
          nationalityId: _nationalityId,
          gender: _genderId,
          femaleNumbers: numOfFeMalesController!.text != ""
              ? int.parse(numOfFeMalesController!.text)
              : 0,
          maleNumbers: numOfMalesController!.text != ""
              ? int.parse(numOfMalesController!.text)
              : 0,
          ageFrom: _initialAgeFrom,
          ageTo: _initialAgeTo,
          skillsIds: _skillIds,

          // languageIds: _lanIds,
          // workTypeId: _workTypeId,
          companyAddress: workLocationController!.text,
          companyLat: _lat,
          companyLon: _lon,
          fullAddress: detailedAddressController!.text,
          accountTypeId: _accountTypeId,
          startDate: startDateController!.text,
          endDate: endDateController!.text,
          timeTypeId: _workTimeType.value,
          numOfDays: _workTimeType == 1 ? _days : _daysSelected.length,
          startTime: _workStartTime,
          endTime: _workEndTime,
          requestStatus: requestStatus,
          price: int.parse(costController!.text.toString()),
          // priceTypeId: _priceTypeId,
          description: jobDescriptionController!.text,
          days: _daysSelected,
          startDateFullFormat: _startDateFullFormat.toString(),
          endDateFullFormat: _endDateFullFormat.toString(),
          startTimeFullFormat: _startTimeFullFormat.toString(),
          endTimeFullFormat: _endTimeFullFormat.toString(),
        ),
        isEdit: isEdit,
      );
      update();
      if (_dataState is DataSuccess) {
        Get.back();
        Get.back();
        Get.back();
        Utils.showDialog(
          child: DialogAddJobSuccessfully(
            onOkTap: () {
              Get.back();
              Get.to(
                () => JobDetailsScreen(
                  job: _dataState!.data as CompanyJobModel,
                ),
              );
            },
          ),
        );
        _fetchMyJobsController.fetchJobs();
        _myJobsController.updateAfterEdit(jobModel!.id, _dataState!.data!);
      } else {
        AppSnacks.requestError(error: _dataState!.message);
      }
      Utils.closeDialog();
    }
    update();
  }

  /// ------------------------ Edit JOB ----------------------------
  void editJob() async {
    if (checkCost()) {
      _dataState = const DataLoading();
      update();
      printDM("Edit CAN PROCEED");
      update();
      printDM("data => ${dataState.runtimeType}");
      if (dataState!.error!.errorType == ErrorType.unKnown) {
        AppSnacks.requestError(
            error: dataState!.error?.errorTitle, isToast: true);
      }
    }
  }

  /// ------------------------ Scheduling JOB ----------------------------
  bool isScheduling = false;

  // void schedulingJob() {
  //   if (_formKey2.currentState!.validate()) {
  //     sendRequest(requestStatus: isEdit ? 0 : 0);
  //     // _showPennedDialog();
  //   }
  // }

  @override
  void onInit() {
    // ControllersActions.initEmpty([
    //   startDateController!,
    // ]);
    calculateTotalCost();

    printDM("enter in init step 1");
    if (isEdit) {
      printDM("enter in init step 2");
      _bassDataToController();
      printDM("enter in init step 3");
    } else {
      printDM("enter in init step 11");
      _initController();
      printDM("enter in init step 22");
      getLocation();
      printDM("enter in init step 33");
    }
    printDM("enter in init step 4");

    _listenToSet1Controllers();
    printDM("enter in init step 5");

    // _listenToSet2Controllers();
    super.onInit();
  }

  @override
  void dispose() {
    _disposeControllers();
    printDM("dispose done in add job");
    super.dispose();
  }

  String calcAge() {
    if (jobModel!.ageTo != 0 && jobModel!.ageFrom != 0) {
      if (jobModel!.ageTo.toString() == jobModel!.ageFrom.toString()) {
        return jobModel!.ageTo.toString();
      } else {
        final String calcAge =
            "${jobModel!.ageTo.toString()} : ${jobModel!.ageFrom.toString()}";
        return calcAge;
      }
    } else {
      return '';
    }
  }

  void _bassDataToController() {
    serviceNameController = TextEditingController(text: jobModel!.serviceTitle);
    _serviceId = jobModel!.serviceId;
    jumpersController =
        TextEditingController(text: jobModel!.jumperNumbers.toString());
    nationalityController =
        TextEditingController(text: jobModel!.nationalityTitle);
    _nationalityId = jobModel!.nationalityId;
    for (var item in GenderData.genderList) {
      printDM('enter hear 0 +');
      if (item.id == jobModel!.gender) {
        printDM('enter hear 1 +');
        printDM('item.label!.tr ${item.label!.tr} +');
        genderController = TextEditingController(text: item.label!.tr);
        // numOfMalesController = TextEditingController(text: item.label!.tr);
        // numOfFeMalesController = TextEditingController(text: item.label!.tr);
        printDM('enter hear 2 +');
        break;
      }
      printDM('enter hear 3 +');
    }
    _genderId = jobModel!.gender;
    ageFromController =
        TextEditingController(text: jobModel!.ageFrom.toString());
    setInitialAgeFrom(jobModel!.ageFrom);
    ageToController = TextEditingController(text: jobModel!.ageTo.toString());
    setInitialAgeTo(jobModel!.ageTo);
    ageController = TextEditingController(text: calcAge());
    if (jobModel!.skills.isNotEmpty) {
      List<String> _listTitles = [];
      List<int> _listIds = [];
      for (var item in jobModel!.skills) {
        _listTitles.add(item.title);
        _listIds.add(item.id);
      }
      skillsController = TextEditingController(text: _listTitles.join(" , "));
      _skillIds = _listIds;
      _skillTitles = _listTitles;
    } else {
      skillsController = TextEditingController();
    }
    workTimeTypeController =
        TextEditingController(text: jobModel!.timeTypeTitle);
    _workTimeType.value = jobModel!.timeTypeId;
    if (jobModel!.languages.isNotEmpty) {
      List<String> _listTitles = [];
      List<int> _listIds = [];
      for (var item in jobModel!.languages) {
        _listTitles.add(item.title);
        _listIds.add(item.id);
      }
      languagesController =
          TextEditingController(text: _listTitles.join(" , "));
      _lanIds = _listIds;
      _lanTitles = _listTitles;
    } else {
      languagesController = TextEditingController();
    }
    workLocationController =
        TextEditingController(text: jobModel!.companyAddress);
    _lat = jobModel!.companyLat;
    _lon = jobModel!.companyLon;
    detailedAddressController =
        TextEditingController(text: jobModel!.fullAddress);

    /// screen 2
    accountTypeController = TextEditingController(text: jobModel!.accountType);
    _accountTypeId = jobModel!.accountTypeId;
    workTimesController =
        TextEditingController(text: jobModel!.days.join(" , "));
    startDateController!.text = workTimesController!.text.split(' , ').first;
    endDateController!.text = workTimesController!.text.split(' , ').last;

    printDM("startDateController is ${startDateController!.text}");
    printDM("endDateController is ${endDateController!.text}");

    if (jobModel!.days.isNotEmpty) {
      _daysSelected = jobModel!.days;
      for (var item in jobModel!.days) {
        printDM("days before convert is $item");
        _daysSelectedConverted.add(DateFormat('yyyy/MM/dd').parse(item));
      }
      printDM("days after convert is $_daysSelectedConverted");
    }
    printDM("enter in bass data 1");

    startDateController = TextEditingController(text: jobModel!.startDate);
    printDM("enter in bass data 2");
    workContractDurationController = TextEditingController(
        text: DateUtilities.convertDurationToDay(jobModel!.totalWorkDays));
    printDM("enter in bass data 3");
    endDateController = TextEditingController(text: jobModel!.endDate);
    workStartTimeController =
        TextEditingController(text: jobModel!.startTimeFormat);
    printDM("enter in bass data 4");

    workEndTimeController =
        TextEditingController(text: jobModel!.endTimeFormat);
    printDM("enter in bass data 5");
    if (jobModel!.startDateFullFormat != "") {
      _startDateFullFormat = DateTime.parse(jobModel!.startDateFullFormat);
    }
    printDM("enter in bass data 6");
    if (jobModel!.endDateFullFormat != "") {
      _endDateFullFormat = DateTime.parse(jobModel!.endDateFullFormat);
    }
    printDM("enter in bass data 7");
    if (jobModel!.startTimeFullFormat != "") {
      _startTimeFullFormat = DateTime.parse(jobModel!.startTimeFullFormat);
    }
    printDM("enter in bass data 8");
    if (jobModel!.endTimeFullFormat != "") {
      _endTimeFullFormat = DateTime.parse(jobModel!.endTimeFullFormat);
    }
    printDM("enter in bass data 9");

    workTypeController = TextEditingController(text: jobModel!.workTypeTitle);
    printDM("enter in bass data 10");

    costController = TextEditingController(text: jobModel!.salary.toString());
    printDM("enter in bass data 12");

    totalCostController = TextEditingController();
    printDM("enter in bass data 13");

    jobDescriptionController =
        TextEditingController(text: jobModel!.description);
    printDM("enter in bass data 14");

    update();
  }

  void _initController() {
    calcWorkPeriodAuto();

    /// screen 1
    serviceNameController = TextEditingController();
    jumpersController = TextEditingController();
    nationalityController = TextEditingController();
    genderController = TextEditingController();
    numOfMalesController = TextEditingController();
    numOfFeMalesController = TextEditingController();
    ageFromController = TextEditingController();
    ageToController = TextEditingController();
    ageController = TextEditingController();
    skillsController = TextEditingController();
    workTimeTypeController = TextEditingController();
    languagesController = TextEditingController();
    workLocationController = TextEditingController();
    detailedAddressController = TextEditingController();
    cityController = TextEditingController();

    /// screen 2
    accountTypeController = TextEditingController();
    workContractDurationController = TextEditingController();
    startDateController = TextEditingController();
    workTimesController = TextEditingController();
    endDateController = TextEditingController();
    workStartTimeController = TextEditingController();
    workEndTimeController = TextEditingController();
    workTypeController = TextEditingController();
    costController = TextEditingController();
    totalCostController = TextEditingController();
    jobDescriptionController = TextEditingController();
  }

  /// controllers --------------------------------------------------------------

  void _listenToSet1Controllers() {
    serviceNameController?.addListener(() {
      _checkProceedButtonCondition();
    });
    startDateController?.addListener(() {
      calcWorkPeriodAuto();
    });
    workContractDurationController?.addListener(() {
      calcWorkPeriodAuto();
    });
    workLocationController?.addListener(() {
      _checkProceedButtonCondition();
    });
  }

  void _checkProceedButtonCondition() {
    if (serviceNameController!.text.isNotEmpty &&
        jumpersController!.text.isNotEmpty &&
        nationalityController!.text.isNotEmpty &&
        genderController!.text.isNotEmpty &&
        numOfMalesController!.text.isNotEmpty &&
        numOfFeMalesController!.text.isNotEmpty &&
        ageFromController!.text.isNotEmpty &&
        ageToController!.text.isNotEmpty &&
        ageController!.text.isNotEmpty &&
        skillsController!.text.isNotEmpty &&
        workTimeTypeController!.text.isNotEmpty &&
        languagesController!.text.isNotEmpty &&
        workLocationController!.text.isNotEmpty) {
      _isProceedButtonDisabled = false;
      update();
    }
  }

  // void _listenToSet2Controllers() {
  //   accountTypeController?.addListener(() {
  //     _checkPublishButtonCondition();
  //   });
  //   costController?.addListener(() {
  //     _checkPublishButtonCondition();
  //   });
  // }

  // void _checkPublishButtonCondition() {
  //   jobDescriptionController?.dispose();
  //   if (accountTypeController!.text.isNotEmpty &&
  //       workContractDurationController!.text.isNotEmpty &&
  //       startDateController!.text.isNotEmpty &&
  //       endDateController!.text.isNotEmpty &&
  //       workStartTimeController!.text.isNotEmpty &&
  //       workEndTimeController!.text.isNotEmpty &&
  //       perCostController!.text.isNotEmpty &&
  //       workTypeController!.text.isNotEmpty &&
  //       costController!.text.isNotEmpty &&
  //       jobDescriptionController!.text.isNotEmpty) {
  //     _isPublishButtonDisabled = false;
  //     _isPennedButtonDisabled = false;
  //     update();
  //   }
  // }

  void _disposeControllers() {
    /// screen 1
    serviceNameController?.dispose();
    jumpersController?.dispose();
    nationalityController?.dispose();
    genderController?.dispose();
    numOfMalesController?.dispose();
    numOfFeMalesController?.dispose();
    ageFromController?.dispose();
    ageToController?.dispose();
    ageController?.dispose();
    skillsController?.dispose();
    workTimeTypeController?.dispose();
    languagesController?.dispose();
    workLocationController?.dispose();
    detailedAddressController?.dispose();

    /// screen 2
    accountTypeController?.dispose();
    workContractDurationController?.dispose();
    startDateController?.dispose();
    workTimesController?.dispose();
    endDateController?.dispose();
    workStartTimeController?.dispose();
    workEndTimeController?.dispose();
    totalCostController?.dispose();
    workTypeController?.dispose();
    costController?.dispose();
    jobDescriptionController?.dispose();
  }
}

class DatePickerMultipleWidget extends StatelessWidget {
  final List<DateTime> daysSelected;
  final dynamic Function(Object?) onSubmit;

  const DatePickerMultipleWidget({
    required this.daysSelected,
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: SizedBox(
            width: double.infinity,
            height: 300.h,
            child: SfDateRangePicker(
              selectionColor: AppColors.primary,
              todayHighlightColor: AppColors.primary,
              headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: AppColors.primary,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: AppStrings.fontFamily,
                  )),
              selectionTextStyle: const TextStyle(
                fontFamily: AppStrings.fontFamily,
              ),
              monthCellStyle: const DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                      fontFamily: AppStrings.fontFamily, color: Colors.black)),
              showNavigationArrow: true,
              maxDate: DateTime(2030),
              minDate: DateTime.now(),
              showTodayButton: true,
              backgroundColor: Colors.white,
              initialSelectedDates: daysSelected,
              // onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.multiple,
              enablePastDates: false,
              onCancel: () {
                Get.back();
              },
              onSubmit: (val) {
                onSubmit(val);
              },
              showActionButtons: true,
            ),
          ),
        ),
      ),
    );
  }
}
