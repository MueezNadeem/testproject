import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_user_chats.dart';
import 'package:testproject/common/helpers/get_user_stored_pref.dart';
import 'package:testproject/features/users_list/screens/registered_users.dart';

import '../../../common/models/chat.dart';
import '../../message_user/screens/message_user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Chat>? chats = [];
  String? userPhone = "";
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        appBar: AppBar(
          title: Text(userPhone!),
          bottom: TabBar(controller: _tabController, tabs: const [
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Group",
            )
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            UserChats(chats: chats, userPhone: userPhone),
            Container(
              color: Colors.amber,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UsersList(userPhone)));
          },
          child: const Icon(Icons.add),
        ));
  }
}

class UserChats extends StatelessWidget {
  const UserChats({
    super.key,
    required this.chats,
    required this.userPhone,
  });

  final List<Chat>? chats;
  final String? userPhone;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
