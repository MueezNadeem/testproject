import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/message.dart';

import '../models/chat.dart';

Future<void> saveMessage(Message message, Chat? chat) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  ref = ref.child("chats").child(chat!.id).child("messages").push();

  await ref.set({
    "content": message.content,
    "senderId": message.senderID,
    "timestamp": message.timestamp,
  });
}
