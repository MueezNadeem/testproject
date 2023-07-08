import 'package:flutter/material.dart';
import 'package:testproject/features/user_registeration/widgets/register_appbar.dart';

import '../../../common/firebase/save_user_to_firebase.dart';
import '../../../common/helpers/save_user_stored_pref.dart';
import '../../home_screen/screens/home_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController name;
  late TextEditingController phone;
  late bool text;
  late bool phone_;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    phone = TextEditingController();
    text = false;
    phone_ = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: registerAppBar(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: 'Enter Name',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: 'Enter Phone',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)))),
              )
            ],
          ),
        ),
        //registerTextFields(name, phone),
        // proceedButton(
        //     context, validData(name.text, phone.text), name.text, phone.text)
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: ElevatedButton(
              onPressed: () async {
                if (name.text.isEmpty || phone.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid Data')));
                } else {
                  await saveUsertoFireBase(name.text, phone.text);
                  await saveUsertoStoredPref(name.text, phone.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(120, 40))),
              child: const Text('Proceed'),
            ),
          ),
        ))
      ]),
    );
  }
}
