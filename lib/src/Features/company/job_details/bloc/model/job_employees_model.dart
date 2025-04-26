import 'package:jumper/src/Bloc/models/candidate_model.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Ui/cards/candidate_card.dart';

class JobEmployeesModel {
  late List<CandidateModel> allEmployees;
  late List<CandidateModel> acceptedEmployees;
  late List<CandidateModel> refusedEmployees;
  late List<CandidateModel> fav_employees;
  late List<CandidateModel> worked_employees;

  JobEmployeesModel({
    required this.allEmployees,
    required this.acceptedEmployees,
    required this.refusedEmployees,
    required this.fav_employees,
    required this.worked_employees,
  });

  @override
  String toString() {
    return 'JobEmployeesModel{allEmployees: $allEmployees, acceptedEmployees: $acceptedEmployees, refusedEmployees: $refusedEmployees}';
  }

  JobEmployeesModel.fromJson(Map<String, dynamic> json) {
    allEmployees = json['all_employees'] != null
        ? List.from(json['all_employees'])
            .map((e) => CandidateModel.fromMap(e))
            .toList()
        : [];
    // allEmployees = [];
    printDM("JOB EMPLOYEES allEmployees $allEmployees");
    acceptedEmployees = json['accepted_employees'] != null
        ? List.from(json['accepted_employees'])
            .map((e) => CandidateModel.fromMap(e))
            .toList()
        : [];
    printDM("JOB EMPLOYEES acceptedEmployees $acceptedEmployees");

    refusedEmployees = json['refused_employees'] != null
        ? List.from(json['refused_employees'])
            .map((e) => CandidateModel.fromMap(e))
            .toList()
        : [];
    printDM("JOB EMPLOYEES refusedEmployees $refusedEmployees");

    worked_employees = json['worked_employees'] != null
        ? List.from(json['worked_employees'])
            .map((e) => CandidateModel.fromMap(e))
            .toList()
        : [];
    printDM("JOB EMPLOYEES job_employee_attendance $worked_employees");

    fav_employees = json['fav_employees'] != null
        ? List.from(json['fav_employees'])
            .map((e) => CandidateModel.fromMap(e))
            .toList()
            .where(
                (element) => element.candidateStatus == CandidateState.waiting)
            .toList()
        : [];
    printDM("JOB EMPLOYEES fav_employees $fav_employees");
  }
}
