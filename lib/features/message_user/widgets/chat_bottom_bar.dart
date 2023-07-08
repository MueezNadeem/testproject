import 'package:flutter/material.dart';

Widget chatBottomBar() {
  return Row(
    children: [
      const Padding(
        padding: EdgeInsets.all(8),
        child: TextField(
          controller: null,
          decoration: InputDecoration(hintText: "Enter Message"),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(8),
          child: FilledButton(
            onPressed: () {},
            child: const Text("Send"),
          ))
    ],
  );
}
