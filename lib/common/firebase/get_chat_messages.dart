import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/message.dart';

Future<List<Message>> getMessages(String chatID) async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref('chats').child(chatID).child("messages");
  DataSnapshot snapshot = await ref.get();

  Map<dynamic, dynamic>? messageMap = snapshot.value as Map<dynamic, dynamic>?;
  if (messageMap == null) {
    return [];
  } else {
    List<Message> messageList = messageMap.entries.map((entry) {
      String messageID = entry.key.toString();
      Map<dynamic, dynamic> data = entry.value as Map<dynamic, dynamic>;
      Message message = Message();
      message.id = messageID;
      message.content = data['content'].toString();
      message.senderID = data['senderId'].toString();
      message.timestamp = data['timestamp'] as int;

      return message;
    }).toList();
    return messageList;
  }
}
