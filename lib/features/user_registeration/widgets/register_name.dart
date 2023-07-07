import 'package:flutter/material.dart';

Widget nameField(name) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextField(
        controller: name,
        decoration: const InputDecoration(
            hintText: 'Enter Name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5)))),
  );
}
