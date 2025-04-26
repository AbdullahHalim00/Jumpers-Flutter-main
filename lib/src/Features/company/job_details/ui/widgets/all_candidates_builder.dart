part of 'imports_widgets_job_details_screen.dart';

class AllCandidateBuilder extends StatelessWidget {
  final List<CandidateModel> candidates;
  final int jobID;
  final CompanyJobModel job;

  const AllCandidateBuilder({
    Key? key,
    required this.candidates,
    required this.jobID,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      index: candidates.length,
      durationStyle: (candidates.length > 100)
          ? WrapDurationStyle.flash
          : ((candidates.length > 50
              ? WrapDurationStyle.veryFast
              : WrapDurationStyle.fast)),
      child: ListView.builder(
        physics: AppPhysics.alwaysScrollablePhysics,
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final CandidateModel candidate = candidates[index];
          return CandidateCard.all(
            job: job,
            candidateState: candidate.candidateStatus,
            name: candidate.name,
            age: candidate.age.toString(),
            gender: candidate.gender,
            jobDescription: candidate.service,
            nationality: candidate.nationality,
            userImage: candidate.image,
            jobID: jobID,
            employeeID: candidate.id,
            onDetailsPressed: () {
              Get.to(() => CandidateDetailsScreen(candidate));
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
