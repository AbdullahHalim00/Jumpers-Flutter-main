part of 'imports_job_details_screen.dart';

class AcceptedCandidatesScreen extends StatelessWidget {
  final int jobID;
  final CompanyJobModel job;

  const AcceptedCandidatesScreen(
      {Key? key, required this.jobID, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobEmployeesController jobEmployeesController = Get.find();
    return GetBuilder<JobEmployeesController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: _.dataState is DataSuccess
            ? ConditionalBuilder(
                condition: (_.dataState.data!.acceptedEmployees.isNotEmpty),
                // if list not empty
                // condition: true,// if list not empty
                onBuild: AcceptedCandidateBuilder(
                    jobID: jobID,
                    candidates: _.dataState.data!.acceptedEmployees,
                    job: job),
                onFeedBack:
                    const SingleChildScrollView(child: EmptyCandidateBuilder()),
              )
            : 0.0.ESH(),
      );
    });
  }
}
