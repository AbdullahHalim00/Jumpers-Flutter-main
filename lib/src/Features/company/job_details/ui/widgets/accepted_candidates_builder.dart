part of 'imports_widgets_job_details_screen.dart';

class AcceptedCandidateBuilder extends StatelessWidget {
  final List<CandidateModel> candidates;
  final int jobID;
  final CompanyJobModel job;

  const AcceptedCandidateBuilder({
    Key? key,
    required this.candidates,
    required this.jobID,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      index: candidates.length,
      child: ListView.builder(
        physics: AppPhysics.alwaysScrollablePhysics,
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];
          return CandidateCard.accepted(
            candidateState: candidate.candidateStatus,
            status: job.status,

            /// edit later
            jobID: jobID,
            employeeID: candidate.id,
            name: candidate.name,
            job: job,
            age: candidate.age.toString(),
            gender: candidate.gender,
            jobDescription: candidate.service,
            nationality: candidate.nationality,
            userImage: candidate.image,
            job_employee_review: candidate.job_employee_review,
            onDetailsPressed: () {
              Get.to(CandidateDetailsScreen(candidate));
            },
            onCardLongPress: () {
              Utils.showPreviewDialog(
                child: SneakyCandidateDialog(
                  candidate: candidate,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
