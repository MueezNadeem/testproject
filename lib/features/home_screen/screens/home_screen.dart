import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_user_chats.dart';
import 'package:testproject/common/helpers/get_user_stored_pref.dart';
import 'package:testproject/common/screens/registered_users.dart';

import '../../../common/models/chat.dart';
import '../../message_user/screens/message_user_screen.dart';
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
    getUserFromStoredPref().then((value) {
      setState(() {
        userPhone = value;
      });
      getChats(userPhone!).then((value1) {
        setState(() {
          chats = value1;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(userPhone!)),
        body: Center(
          child: ListView.builder(
            itemCount: chats!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                child: ListTile(
                  title: Text(chats![index].recipient),
                  subtitle: Text(chats![index].lastMessage),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserMessage(chats![index], userPhone)));
                  },
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersList()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
