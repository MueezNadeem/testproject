import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/chat.dart';

Future<List<Chat>?> getChats(username) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  DataSnapshot snapshot =
      await ref.child('users').child(username).child('chats').get();
  Map<dynamic, dynamic>? chats = snapshot.value as Map<dynamic, dynamic>?;
  if (chats == null) {
    return [];
  } else {
    List<Chat> chatList = chats.entries.map((entry) {
      String chatId = entry.key.toString();
      Map<dynamic, dynamic> data = entry.value as Map<dynamic, dynamic>;

      Chat chat = Chat();
      chat.recipient = chatId;
      chat.lastMessage = data['lastMessage'].toString();
      chat.id = data['id'].toString();
      return chat;
    }).toList();
    return chatList;
  }
}
