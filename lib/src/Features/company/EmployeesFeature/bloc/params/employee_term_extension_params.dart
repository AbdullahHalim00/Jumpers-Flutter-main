class EmployeeTermExtensionParams {
  int employeeId;
  String startDate;
  String endDate;

  // String period;

  EmployeeTermExtensionParams({
    required this.employeeId,
    required this.startDate,
    required this.endDate,
    // required this.period,
  });

  Map<String, dynamic> toJson() {
    return {
      'employee_id': employeeId,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}
