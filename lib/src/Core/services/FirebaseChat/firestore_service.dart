import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumper/src/Core/services/FirebaseChat/firebase_constants.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/chat.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static void updateChatProperties({
    required String chatId,
    required List<SharedProperties> sharedProperties,
  }) {
    printDM("chatID => $chatId , chatIDTYPE => ${chatId.runtimeType}");
    final CollectionReference collectionReference =
        _firestore.collection(kChatsCollection);
    collectionReference.doc(chatId).update({
      "shared_properties": sharedProperties.map((e) => e.toJson()).toList()
    }).whenComplete(() async {
      printDM("issssssCompleted");
    }).catchError((e) => printDM(e));
  }
// static void update
}
