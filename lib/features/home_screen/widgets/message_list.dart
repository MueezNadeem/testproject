import 'package:flutter/material.dart';

import '../../../common/models/chat.dart';
import '../../message_user/screens/message_user_screen.dart';

Widget messageList(List<Chat> chats, String userPhone) {
  return Center(
    child: ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(chats[index].recipient),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserMessage(chats[index])));
          },
        );
      },
    ),
  );
}
