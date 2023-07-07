import 'package:flutter/material.dart';
import 'package:testproject/features/user_registeration/controller/check_input_validity.dart';
import 'package:testproject/features/user_registeration/widgets/register_appbar.dart';
import 'package:testproject/features/user_registeration/widgets/register_button.dart';
import 'package:testproject/features/user_registeration/widgets/register_textfields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _name;
  late TextEditingController _phone;
  late bool text;
  late bool phone;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _phone = TextEditingController();
    text = false;
    phone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: registerAppBar(),
      body: Column(children: [
        registerTextFields(_name, _phone),
        proceedButton(context, validData(_name.text, _phone.text), _name.text,
            _phone.text)
      ]),
    );
  }
}
