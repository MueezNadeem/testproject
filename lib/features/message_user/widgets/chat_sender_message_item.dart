import 'package:flutter/material.dart';
import 'package:testproject/common/models/message.dart';

Widget senderMessage(Message message) {
  return Container(
    color: const Color.fromARGB(255, 32, 82, 190),
    padding: const EdgeInsets.all(8),
    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        message.content,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      Text(
        message.timestamp,
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      )
    ]),
  );
}
