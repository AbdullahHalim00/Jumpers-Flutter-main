part of 'widgets_notifications_imports.dart';

class NotificationContent extends StatelessWidget {
  final String? title;

  final String? subtitle;

  final String? date;

  const NotificationContent({Key? key, this.title, this.subtitle, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title ?? "",
            isUpperCase: true, fontSize: 13, fontWeight: FW.medium),
        YSpace.tiny,
        CustomText.subtitle(subtitle ?? "",
            fontSize: 11, fontWeight: FW.medium),
        YSpace.tiny,
        CustomText.subtitle(
          date ?? "",
          fontSize: 9,
          fontWeight: FW.light,
        ),
      ],
    );
  }
}
