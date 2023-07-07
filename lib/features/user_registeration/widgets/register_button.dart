import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/save_user_to_firebase.dart';
import 'package:testproject/common/helpers/save_user_stored_pref.dart';
import 'package:testproject/common/screens/home_screen.dart';

Widget proceedButton(context, bool flag, name, phone) {
  {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: ElevatedButton(
          onPressed: () async {
            if (flag == false) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Invalid Data')));
            } else {
              await saveUsertoFireBase(name, phone);
              await saveUsertoStoredPref(name, phone);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
          style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(120, 40))),
          child: const Text('Proceed'),
        ),
      ),
    ));
  }
}
