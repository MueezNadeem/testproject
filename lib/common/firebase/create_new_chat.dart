import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/user.dart';

Future<String> createNewChat(User recipient, String senderID) async {
  DatabaseReference mainReference = FirebaseDatabase.instance.ref();
  // DatabaseReference chatIDreference = mainReference.child("chats").push();
  // String chatID = chatIDreference.key.toString();
  List<String> nums = [senderID, recipient.id]..sort();
  String chatID = nums.join();

  DatabaseReference userChatreference = mainReference
      .child("users")
      .child(senderID)
      .child("chats")
      .child(recipient.id);

  await userChatreference.set({
    "id": chatID,
    "lastMessage": "",
    "recipient": recipient.name,
  });
  return chatID;
}
