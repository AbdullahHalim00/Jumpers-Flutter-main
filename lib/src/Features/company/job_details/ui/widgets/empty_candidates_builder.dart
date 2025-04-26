part of 'imports_widgets_job_details_screen.dart';

class EmptyCandidateBuilder extends StatelessWidget {
  const EmptyCandidateBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "empty_candidates".tr,
      imageUrl: Assets.emptyEmployees,
    );
  }
}
