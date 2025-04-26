part of 'imports_widgets_jumper_jobs.dart';

class JumperBasicAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const JumperBasicAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBars.basic(
      title: title,
      centerTitle: false,
      isTitleBold: true,
      actions: const [
        MessageBadge(),
        NotificationBadge(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBars.jobs().toolbarHeight!);
}
