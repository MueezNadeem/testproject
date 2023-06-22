import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testproject/user.dart';
import 'package:testproject/userhome.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<StatefulWidget> createState() => RegisterUserState();
}

class RegisterUserState extends State<StatefulWidget> {
  final String fileName = "credentials.txt";
  late TextEditingController _username;

  @override
  void initState() {
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Register User')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(hintText: 'Enter Name'),
              ),
            ),
            FilledButton(
              onPressed: () async {
                String macAddress =
                    "PLACEHOLDER"; // MAC Address library does not function; replace with Phone
                String name = _username.text;
                Directory directory = await getApplicationDocumentsDirectory();
                File file = File('${directory.path}/$fileName');
                await file.writeAsString('$macAddress\n$name');
                print('$macAddress\n$name');
                registerUserToDatabase(macAddress, name);
                User currentUser = User(macAddress, name);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserHome(currentUser: currentUser)),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              child: const Text('Register'),
            )
          ],
        ));
  }

  Future<void> registerUserToDatabase(id, name) async {
    DatabaseReference database = FirebaseDatabase(
            databaseURL:
                "https://testproject-15c7c-default-rtdb.firebaseio.com")
        .reference();
    User temp = User(name, id);
    DatabaseReference userRef = database.child("users").push();
    await userRef.set(<String, String>{
      "username": temp.name,
      "id": userRef.key.toString(),
    });
  }
}
