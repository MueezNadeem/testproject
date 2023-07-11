import 'package:flutter/material.dart';
import 'package:testproject/common/models/message.dart';

Widget recipientMessage(Message message) {
  return Container(
    color: const Color.fromARGB(255, 16, 133, 20),
    padding: const EdgeInsets.all(8),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        message.content,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      Text(
        message.timestamp.toString(),
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      )
    ]),
  );
}
