part of 'imports_widgets_job_screen.dart';

class JobsAppBar extends StatefulWidget with PreferredSizeWidget {
  const JobsAppBar({Key? key}) : super(key: key);

  @override
  State<JobsAppBar> createState() => _JobsAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBars.jobs().toolbarHeight!);
}

class _JobsAppBarState extends State<JobsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBars.jobs();
  }
}
