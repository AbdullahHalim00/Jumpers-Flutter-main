part of 'imports_widgets_chat_details.dart';

class ChatWrapper extends StatelessWidget {
  final Widget child;

  const ChatWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPropertiesController>(builder: (_) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _.currentImage.id != 0
            ? BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_.currentImage.image),
                ),
                color: AppColors.redOverlay,
              )
            : null,
        child: Padding(
          padding: AppInsets.defaultScreenALL,
          child: child,
        ),
      );
    });
  }
}
