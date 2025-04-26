class FinishEmployeeParams {
  int employeeID;
  int finishWorkReasonID;
  String finishWorkReasonText;

  FinishEmployeeParams({
    required this.employeeID,
    required this.finishWorkReasonID,
    required this.finishWorkReasonText,
  });

  Map<String, dynamic> toMap() {
    return {
      'employee_id': employeeID,
      'finish_work_reason_id': finishWorkReasonID,
      'finish_work_reason_text': finishWorkReasonText,
    };
  }
}
