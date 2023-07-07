import 'package:flutter/material.dart';
import 'package:testproject/features/user_registeration/widgets/register_name.dart';
import 'package:testproject/features/user_registeration/widgets/register_number.dart';

Widget registerTextFields(name, phone) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
    child: Column(
      children: [nameField(name), phoneField(phone)],
    ),
  );
}
