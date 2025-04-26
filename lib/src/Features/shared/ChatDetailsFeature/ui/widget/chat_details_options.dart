part of 'imports_widgets_chat_details.dart';

class ChatDetailsOptions extends StatelessWidget {
  const ChatDetailsOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
    return DefaultPopUpButton(
      hasBCG: false,
      popUps: [
        PopUpModel(
          imageUrl: Assets.setting,
          label: "color_properties".tr,
          onSelected: () {
            // Get.delete();
            Get.to(
              () => const ChatPropertiesScreen(),
              duration: AppDurations.mainTransition,
              transition: Transition.downToUp,
            );
          },
          // color: Colors.amber,
        ),
      ],
    );
  }
}
