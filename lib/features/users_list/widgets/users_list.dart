import 'package:flutter/material.dart';
import 'package:testproject/common/models/user.dart';

import '../../../common/firebase/create_new_chat.dart';
import '../../../common/models/chat.dart';
import '../../message_user/screens/message_user_screen.dart';

class users_list extends StatelessWidget {
  const users_list({
    super.key,
    required this.users,
    required this.currentUser,
  });

  final List<User> users;
  final String? currentUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(users[index].name),
            onTap: () async {
              Chat chat = Chat();
              chat.recipient = users[index].name;
              await createNewChat(users[index], currentUser!)
                  .then((value) => chat.id = value);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserMessage(
                            chat,
                            users[index].id,
                          )));
            });
      },
    );
  }
}
