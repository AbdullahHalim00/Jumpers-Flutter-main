part of 'imports_job_details_screen.dart';

class AllCandidatesScreen extends StatelessWidget {
  final int jobID;
  final CompanyJobModel job;

  const AllCandidatesScreen({
    Key? key,
    required this.jobID,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobEmployeesController jobEmployeesController = Get.find();
    return GetBuilder<JobEmployeesController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: _.dataState is DataSuccess
            ? ConditionalBuilder(
                condition: (_.dataState.data!.allEmployees.isNotEmpty),
                // if list not empty
                onBuild: AllCandidateBuilder(
                    job: job,
                    jobID: jobID,
                    candidates: _.dataState.data!.allEmployees),
                onFeedBack: const SingleChildScrollView(
                  child: EmptyCandidateBuilder(),
                ),
              )
            : 0.0.ESH(),
      );
    });
  }
}

class FaveCandidatesWidget extends StatelessWidget {
  final int jobID;
  final CompanyJobModel job;

  const FaveCandidatesWidget({
    Key? key,
    required this.jobID,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobEmployeesController jobEmployeesController = Get.find();
    return GetBuilder<JobEmployeesController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: _.dataState is DataSuccess
            ? ConditionalBuilder(
                condition: (_.dataState.data!.fav_employees.isNotEmpty),
                // if list not empty
                onBuild: AllCandidateBuilder(
                    job: job,
                    jobID: jobID,
                    candidates: _.dataState.data!.fav_employees),
                onFeedBack: const SingleChildScrollView(
                  child: EmptyCandidateBuilder(),
                ),
              )
            : 0.0.ESH(),
      );
    });
  }
}
