part of 'imports_widgets_job_screen.dart';

class JobsFAB extends StatelessWidget {
  const JobsFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return FloatingActionButton(
        backgroundColor: AppColors.secondary,
        child: Icon(
          Icons.add,
          size: 30.h,
        ),
        onPressed: () => _.addJob(),
      );
    });
  }
}
