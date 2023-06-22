import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:testproject/user.dart';
import 'package:testproject/userslist.dart';

class UserHome extends StatefulWidget {
  const UserHome({required this.currentUser, super.key});

  final User currentUser;
  @override
  State<StatefulWidget> createState() => UserHomeState(currentUser);
}

class UserHomeState extends State<StatefulWidget> {
  final String fileName = "credentials.txt";
  var username = "";
  var messages = ['apple', 'banana'];
  late final User currentUser;

  UserHomeState(User currentUser) {
    this.currentUser = currentUser;
  }

  @override
  void initState() {
    super.initState();

    _readFile().then((value) {
      setState(() {
        username = value;
      });
    });
    print(username);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(username)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Center(
                        child: Text(
                  messages[index],
                  style: const TextStyle(fontSize: 20),
                )));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: const Alignment(1.0, 1.0),
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UsersList(currentUser: this.currentUser)),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> _readFile() async {
    String text = "";
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName');
      text = await file.readAsString();
      text = text.split('\n')[1];
    } catch (e) {
      print("Cannot read file");
    }
    return text;
  }
}
