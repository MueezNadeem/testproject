import 'package:flutter/material.dart';

Widget chatBottomBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
            width: 280,
            height: 35,
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "Enter Message",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Send"),
            ))
      ],
    ),
  );
}
