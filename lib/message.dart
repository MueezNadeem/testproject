import 'package:testproject/user.dart';

class Message {
  late String senderID;
  late String recipientID;
  late String content;
  late String timestamp;

  void setSenderID(User user) {
    senderID = user.id;
  }

  void setRecipientID(User user) {
    recipientID = user.id;
  }

  void addContent(String msg) {
    content = msg;
    timestamp = DateTime.timestamp().toString();
  }
}
