class CompanyStaticsModel {
  int? allJobs;
  int? completedJobs;
  int? underReviewJobs;
  int? currentJobs;
  int? employees;

  CompanyStaticsModel(
      {this.allJobs,
      this.completedJobs,
      this.currentJobs,
      this.employees,
      this.underReviewJobs});

  @override
  String toString() {
    return 'CompanyStaticsModel{allJobs: $allJobs, completedJobs: $completedJobs, underReviewJobs: $underReviewJobs, currentJobs: $currentJobs, employees: $employees}';
  }

  CompanyStaticsModel.fromMap(Map<String, dynamic> json) {
    allJobs = json['all_jobs'] ?? 0;
    completedJobs = json['completed_jobs'] ?? 0;

    underReviewJobs = json['under_review_jobs'] ?? 0;

    currentJobs = json['current_jobs'] ?? 0;

    employees = json['my_employees'] ?? 0;
  }
}
