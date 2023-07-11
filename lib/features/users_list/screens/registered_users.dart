import 'package:flutter/material.dart';
import 'package:testproject/common/firebase/get_all_users.dart';
import 'package:testproject/common/models/user.dart';

import '../controller/get_all_phone_contacts.dart';
import '../widgets/users_app_bar.dart';
import '../widgets/users_list.dart';

class UsersList extends StatefulWidget {
  String? userPhone;
  UsersList(this.userPhone, {super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  String? currentUser;
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    currentUser = widget.userPhone;
    getAllUsers().then((value) {
      // setState(() {
      //   users = value;
      // });
      getContacts(value).then((value1) {
        setState(() {
          users = value1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: usersAppBar(),
      body: users_list(users: users, currentUser: currentUser),
    );
  }
}
