import 'package:flutter/material.dart';
import 'package:testproject/features/message_user/widgets/chat_app_bar.dart';
import 'package:testproject/features/message_user/widgets/chat_bottom_bar.dart';
import 'package:testproject/features/message_user/widgets/chat_list_messages.dart';

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
  Chat? currentChat;
  String? currentUser;
  List<Message> messages = [];
  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
    currentChat = widget.chat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: chatAppBar(currentChat!),
        body: Column(
          children: [chatListMessage(messages, currentUser!), chatBottomBar()],
        ));
  }
}
