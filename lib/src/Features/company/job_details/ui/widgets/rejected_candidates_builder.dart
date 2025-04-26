part of 'imports_widgets_job_details_screen.dart';

class RejectedCandidateBuilder extends StatelessWidget {
  final List<CandidateModel> candidates;
  final int jobID;
  final CompanyJobModel job;

  const RejectedCandidateBuilder(
      {Key? key,
      required this.candidates,
      required this.job,
      required this.jobID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      index: candidates.length,
      child: ListView.builder(
        physics: AppPhysics.alwaysScrollablePhysics,
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];

          return CandidateCard.rejected(
            key: key,
            name: candidate.name,
            age: candidate.age.toString(),
            gender: candidate.gender,
            job: job,
            jobDescription: candidate.service,
            nationality: candidate.nationality,
            userImage: candidate.image,
            jobID: jobID,
            employeeID: candidate.id,
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
