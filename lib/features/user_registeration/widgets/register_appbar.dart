import 'package:flutter/material.dart';

PreferredSizeWidget registerAppBar() {
  return AppBar(
    title: const Center(
      child: Text(
        "Register",
        style: TextStyle(color: Colors.black),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
