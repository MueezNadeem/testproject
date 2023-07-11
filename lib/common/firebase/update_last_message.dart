import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/chat.dart';
import 'package:testproject/common/models/message.dart';

Future<void> updateLastMessage(
    String senderID, Chat chat, Message message) async {
  DatabaseReference mainReference = FirebaseDatabase.instance.ref();
  DatabaseReference lastMsgReference = mainReference
      .child("users")
      .child(senderID)
      .child("chats")
      .orderByChild("id")
      .equalTo(chat.id)
      .ref;

  await lastMsgReference.update({"lastMessage": message});
}
