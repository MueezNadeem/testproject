import 'package:flutter/material.dart';
import 'package:testproject/common/models/message.dart';

Widget recipientMessage(Message message) {
  return Container(
    decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 0.2, color: Colors.black))),
    padding: const EdgeInsets.all(5),
    child: Column(children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1), color: Colors.blue),
          child: Text(
            message.content,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: const Color.fromARGB(255, 16, 143, 20)),
          child: Text(
            message.timestamp.toString(),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ))
    ]),
  );
}
