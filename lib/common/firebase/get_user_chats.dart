import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/chat.dart';

Future<List<Chat>> getChats(String userName) async {
  final databaseReference = FirebaseDatabase.instance.ref();

  DataSnapshot snapshot =
      await databaseReference.child('users/$userName/chats').get();
  Map<dynamic, dynamic>? chatsMap = snapshot.value as Map<dynamic, dynamic>?;

  if (chatsMap == null) {
    return [];
  }

  List<Chat> chats = [];

  for (var recipientId in chatsMap.keys) {
    DataSnapshot chatSnapshot = await databaseReference
        .child('users/$userName/chats/$recipientId')
        .get();
    Map<dynamic, dynamic>? chatData =
        chatSnapshot.value as Map<dynamic, dynamic>?;

    if (chatData != null) {
      String chatId = chatData['id'].toString();
      String lastMessage = chatData['lastMessage'].toString();
      String recipient = chatData['recipient'].toString();
      Chat chat = Chat();
      chat.recipient = recipient;
      chat.id = chatId;
      chat.lastMessage = lastMessage;

      chats.add(chat);
    }
  }

  return chats;
}
