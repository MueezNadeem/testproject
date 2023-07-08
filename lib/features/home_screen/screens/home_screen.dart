import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_user_chats.dart';
import 'package:testproject/common/helpers/get_user_stored_pref.dart';
import 'package:testproject/common/screens/registered_users.dart';

import '../../../common/models/chat.dart';
import '../widgets/message_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Chat>? chats = [];
  String? userPhone = "";
  @override
  void initState() {
    super.initState();

    getUserFromStoredPref().then((value) {
      setState(() {
        userPhone = value;
      });
      getChats(userPhone).then((value1) {
        setState(() {
          chats = value1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: messageList(chats!, userPhone!),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersList()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
