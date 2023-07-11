import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../home_screen/screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String? verificationId;

  const OtpScreen({super.key, this.verificationId});

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _otpController = TextEditingController();

  Future<void> signInWithOTP(BuildContext context) async {
    try {
      final String otp = _otpController.text.trim();

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId!,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid OTP'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Verify OTP'),
              onPressed: () => signInWithOTP(context),
            ),
          ],
        ),
      ),
    );
  }
}
