import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_chat_messages.dart';
import 'package:testproject/features/message_user/widgets/chat_app_bar.dart';
import 'package:testproject/features/message_user/widgets/chat_list_messages.dart';

import '../../../common/firebase/save_message.dart';
import '../../../common/firebase/update_last_message.dart';
import '../../../common/models/chat.dart';
import '../../../common/models/message.dart';

class UserMessage extends StatefulWidget {
  final Chat? chat;
  final String? user;
  const UserMessage(this.chat, this.user, {super.key});

  @override
  State<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  TextEditingController messageController = TextEditingController();
  Chat? currentChat;
  String? currentUser;
  List<Message> messages = [];
  @override
  void initState() {
    super.initState();

    currentUser = widget.user;
    currentChat = widget.chat;
    messageController = TextEditingController();
    getMessages(currentChat!.id).then((value) {
      setState(() {
        messages = value;
        messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      });
    });

    DatabaseReference ref = FirebaseDatabase.instance
        .ref('chats')
        .child(currentChat!.id)
        .child("messages");
    ref.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? messageMap =
          snapshot.value as Map<dynamic, dynamic>?;
      if (messageMap != null) {
        List<Message> messageList = messageMap.entries.map((entry) {
          String messageID = entry.key.toString();
          Map<dynamic, dynamic> data = entry.value as Map<dynamic, dynamic>;
          Message message = Message();
          message.id = messageID;
          message.content = data['content'].toString();
          message.senderID = data['senderId'].toString();
          message.timestamp = data['timestamp'].toString();

          return message;
        }).toList();
        setState(() async {
          messages = messageList;
          messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
          await updateLastMessage(
              currentUser!, currentChat!, messages[messages.length - 1]);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: chatAppBar(currentChat!),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            chatListMessage(messages, currentUser!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 280,
                    height: 35,
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                          labelText: "Enter Message",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        Message message = Message();
                        message.content = messageController.text;
                        message.senderID = currentUser!;
                        message.timestamp = DateTime.now().toString();
                        setState(() {
                          messages.add(message);
                        });
                        await saveMessage(message, currentChat);
                      },
                      child: const Text("Send"),
                    ))
              ],
            ),
          ],
        ));
  }
}
