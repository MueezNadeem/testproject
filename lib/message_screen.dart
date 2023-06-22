import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testproject/conversation.dart';
import 'package:testproject/message.dart';
import 'package:testproject/user.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    required this.listUser,
    required this.currentUser,
    required this.conversation,
    super.key,
  });

  final User listUser;
  final User currentUser;
  final Conversation conversation;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late TextEditingController message;
  List<Message> messages = [];
  @override
  void initState() {
    message = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with: ${widget.listUser.getName()}"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        alignment: const Alignment(-1, -1),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index].content),
                  );
                },
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: message,
                      decoration: const InputDecoration(
                        hintText: 'Enter text',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  FloatingActionButton(
                    onPressed: () {
                      widget.conversation
                          .addMessage(message.text, widget.currentUser);
                      addMessageToFireBase(message.text, widget.conversation);
                      setState(() {
                        messages = widget.conversation.messages;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addMessageToFireBase(String text, Conversation conversation) async {
    DatabaseReference messageRef = FirebaseDatabase(
            databaseURL:
                "https://testproject-15c7c-default-rtdb.firebaseio.com")
        .reference()
        .child("conversations")
        .child(widget.conversation.conversationID)
        .child("messages")
        .push();
    Message latestMsg = conversation.messages[conversation.messages.length - 1];

    await messageRef.set(<String, String>{
      "content": latestMsg.content,
      "recipientID": latestMsg.recipientID,
      "senderID": latestMsg.senderID,
      "timestamp": latestMsg.timestamp,
    });
  }
}
