import 'package:flutter/material.dart';

Widget phoneField(TextEditingController phone) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextField(
        keyboardType: TextInputType.phone,
        controller: phone,
        decoration: const InputDecoration(
            hintText: 'Enter Phone',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5)))),
  );
}
