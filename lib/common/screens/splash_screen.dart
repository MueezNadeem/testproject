import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject/common/helpers/user_already_registered.dart';
import 'package:testproject/features/home_screen/screens/home_screen.dart';
import 'package:testproject/features/user_registeration/screens/register_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      CheckUserRegistered.userDataExists().then((value) {
        if (value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const RegisterPage(),
          ));
        }
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.purpleAccent,
          Colors.indigoAccent,
        ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
      ),
    ));
  }
}
