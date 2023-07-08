import 'package:flutter/material.dart';
import 'package:testproject/common/models/message.dart';

Widget recipientMessage(Message message) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(8),
    child: Column(children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1), color: Colors.blue),
          child: Text(
            message.content,
            style: const TextStyle(fontSize: 20),
          )),
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: const Color.fromARGB(255, 16, 143, 20)),
          child: Text(
            message.timestamp as String,
            style: const TextStyle(fontSize: 10),
          ))
    ]),
  );
}
