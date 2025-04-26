part of 'imports_chat_details.dart';

class ChatPropertiesScreen extends StatelessWidget {
  const ChatPropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatPropertiesController = Get.find<ChatPropertiesController>();
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "chat_appearance",
        isBack: true,
      ),
      body: Column(
        children: [
          Wrap(
            children: List.generate(chatPropertiesController.chatImages.length,
                (index) {
              final chatImage = chatPropertiesController.chatImages[index];

              return GestureDetector(
                onTap: () {
                  chatPropertiesController.changeImage(index);
                },
                child: Container(
                  color: AppColors.buttonEnabled,
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    chatImage.image,
                    fit: BoxFit.cover,
                    height: 80.h,
                    width: 80.w,
                  ),
                  // child: ColorFiltered(
                  //   colorFilter: ColorFilter.mode(
                  //     AppColors.secondary,
                  //     BlendMode.color,
                  //   ),
                  //   child: Image.asset(
                  //     chatImage.image,
                  //     fit: BoxFit.cover,
                  //     height: 80.h,
                  //     width: 80.w,
                  //   ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
// class ChatImage extends StatelessWidget {
//   final bool isSelected ;
//   final VoidCallback onTap;
//   const ChatImage({Key? key, required this.isSelected, required this.onTap,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         chatPropertiesController.changeImage(index);
//       },
//       child: Container(
//         padding: const EdgeInsets.all(5.0),
//         child: Image.asset(
//           chatImage.image,
//           fit: BoxFit.cover,
//           height: 80.h,
//           width: 80.w,
//         ),
//       ),
//     );
//   }
// }
