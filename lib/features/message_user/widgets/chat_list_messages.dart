import 'package:flutter/material.dart';

import '../../../common/models/message.dart';
import 'chat_recipient_message_item.dart';
import 'chat_sender_message_item.dart';

Widget chatListMessage(List<Message> messages, String userPhone) {
  return ListView.builder(
    itemCount: messages.length,
    itemBuilder: (context, index) {
      if (messages[index].senderID == userPhone) {
        return senderMessage(messages[index]);
      } else {
        return recipientMessage(messages[index]);
      }
    },
  );
}
