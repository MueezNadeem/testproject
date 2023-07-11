import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/otp_screen.dart';

Future<void> verifyPhoneNumber(phone, BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final String phoneNumber = phone;

  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OtpScreen()),
      );
    },
    verificationFailed: (FirebaseAuthException e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    codeSent: (String verificationId, [int? forceResendingToken]) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(verificationId: verificationId),
        ),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
