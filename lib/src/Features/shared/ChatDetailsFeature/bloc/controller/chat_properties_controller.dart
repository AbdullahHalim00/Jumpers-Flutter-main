import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/models/chat_image.dart';

class ChatPropertiesController extends GetxController {
  final GetStorage _box = GetStorage();

  List<ChatImage> chatImages = [
    ChatImage(
      id: 0,
      image: Assets.stop,
    ),
    ChatImage(
      id: 1,
      image: 'assets/images/chat_bg.jpeg',
    ),
    ChatImage(
      id: 2,
      image: 'assets/images/chat_bg_2.jpg',
    ),
    ChatImage(
      id: 3,
      image: 'assets/images/chat_bg_3.jpg',
    ),
    ChatImage(
      id: 4,
      image: 'assets/images/chat_bg_4.jpg',
    ),
    ChatImage(
      id: 5,
      image: 'assets/images/chat_bg_5.jpg',
    ),
    ChatImage(
      id: 6,
      image: 'assets/images/chat_bg_6.jpg',
    ),
  ];

  ChatImage get currentImage {
    final index = _box.read(stgChatBackgroundImageIndex) ?? 0;
    return chatImages[index];
  }

  void changeImage(int index) {
    chatImages = chatImages.map((e) => e.id == index ? e : e).toList();
    _box.write(stgChatBackgroundImageIndex, chatImages[0].id);
    update();
  }

  @override
  void onInit() {
    // _box.remove(stgChatBackgroundImageIndex) ;
    currentImage;
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
