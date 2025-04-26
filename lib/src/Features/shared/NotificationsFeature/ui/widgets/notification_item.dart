part of 'widgets_notifications_imports.dart';

class NotificationItem extends StatelessWidget {
  final NotificationState state;

  /// Id not used
  final int? id;

  final String? title;
  final String? imageUrl;
  final String? subtitle;
  final String? createdAt;
  final bool isNew;

  final GestureTapCallback? onPressed;
  final GestureLongPressCallback? onLongPress;

  const NotificationItem({
    Key? key,
    this.state = NotificationState.General,
    this.title = "",
    this.subtitle = "",
    this.createdAt,
    this.onPressed,
    this.onLongPress,
    this.id,
    this.imageUrl,
    this.isNew = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (isNew
          ? AppColors.notificationEnabled
          : AppColors.notificationDisabled),
      margin: EdgeInsets.only(bottom: 2.h),
      child: InkWell(
        // splashColor: Colors.black,
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.buttonCircleBCG,
                radius: 19.r,
                child: ConditionalBuilder(
                  condition: imageUrl != "" && imageUrl != null,
                  onBuild: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        NetworkImage(imageUrl ?? Assets.networkKDefaultUser),
                  ),
                  onFeedBack: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      Assets.defaultUser,
                    ),
                  ),
                ),
              ),
              // CustomIconAvatar(
              //   imageUrl: imageUrl,
              //   // imageUrl: imageUrl??Assets.networkKDefaultUser,
              //   isNetworkImage: true,
              //   radius: 38.r,
              // ),
              XSpace.normal,
              Expanded(
                child: NotificationContent(
                  title: title,
                  subtitle: subtitle,
                  date: createdAt,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum NotificationState {
  General,
}
