import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_user_chats.dart';
import 'package:testproject/common/helpers/get_user_stored_pref.dart';
import 'package:testproject/common/screens/registered_users.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? chats = [];
  String? userPhone = "";
  @override
  void initState() {
    super.initState();
    getChats(userPhone).then((value) {
      chats = value;
    });
    getUserFromStoredPref().then((value) {
      userPhone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: ListView.builder(
            itemCount: chats?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chats![index]),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersList()));
          },
          child: Icon(Icons.add),
        ));
  }
}
