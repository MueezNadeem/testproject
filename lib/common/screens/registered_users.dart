import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_all_users.dart';
import 'package:testproject/common/models/user.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getAllUsers().then((value) {
      users = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
          );
        },
      ),
    );
  }
}
