import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testproject/firebase_options.dart';
import 'package:testproject/registeruser.dart';
import 'package:testproject/user.dart';
import 'package:testproject/userhome.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  final String fileName = "credentials.txt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Proceed next page'),
            onPressed: () {
              checkFileExists(context);
            },
          ),
        ));
  }

  void checkFileExists(BuildContext context) async {
    String text = "";
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$fileName';
    File file = File('${directory.path}/$fileName');

    bool fileExists = await File(filePath).exists();

    if (fileExists) {
      text = await file.readAsString();
      User currentUser = User(text.split('\n')[0], text.split('\n')[1]);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserHome(currentUser: currentUser)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterUser()),
      );
    }
  }
}
