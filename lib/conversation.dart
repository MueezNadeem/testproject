import 'package:testproject/user.dart';
import 'message.dart';

class Conversation {
  late List<User> userIDs;
  late List<Message> messages;
  late String conversationID;

  Conversation() {
    userIDs = [];
    messages = [];
    conversationID = "";
  }
  void setUsers(User userOne, User userTwo) {
    if (userIDs.isEmpty) {
      userIDs.add(userOne);
      userIDs.add(userTwo);
      userIDs.sort((a, b) => a.name.length.compareTo(b.name.length));
      conversationID = (userIDs[0].id + userIDs[1].id);
    }
  }

  String getConversationID() {
    return conversationID;
  }

  void addMessage(String msg, User user) {
    Message temp = Message();
    temp.addContent(msg);
    if (user == userIDs[0]) {
      temp.setSenderID(userIDs[0]);
      temp.setRecipientID(userIDs[1]);
    } else {
      temp.setSenderID(userIDs[1]);
      temp.setRecipientID(userIDs[0]);
    }
    messages.add(temp);
  }
}
