import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testproject/conversation.dart';
import 'package:testproject/message_screen.dart';
import 'package:testproject/user.dart';

class UsersList extends StatefulWidget {
  const UsersList({required this.currentUser, super.key});

  final User currentUser;

  @override
  State<UsersList> createState() => UsersListState(currentUser);
}

class UsersListState extends State<UsersList> {
  List<User> listUsers = [];
  late User currentUser;
  UsersListState(User currentUser) {
    this.currentUser = currentUser;
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.amber,
            splashColor: Colors.red,
            title: Center(
              child: Text(
                (listUsers[index].getName()),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Conversation temp = Conversation();
              temp.setUsers(listUsers[index], currentUser);
              addConversationtoFirebase(temp);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen(
                        listUser: listUsers[index],
                        currentUser: currentUser,
                        conversation: temp)),
              );
            },
          );
        },
      ),
    );
  }

  void getUsers() async {
    DatabaseReference database = FirebaseDatabase(
            databaseURL:
                "https://testproject-15c7c-default-rtdb.firebaseio.com")
        .reference()
        .child("users");
    final userMap = await database.get();
    var userData = userMap.value as Map<dynamic, dynamic>;
    List users = [];
    userData.forEach((key, value) => users.add((value)));
    print(userData);
    print(users);
    List<User> ListofUsers = [];
    for (int i = 0; i < users.length; i++) {
      Map<dynamic, dynamic> tempData = users[i];
      User tempUser = User(tempData["id"], tempData["username"]);
      tempUser.setName(tempData["username"]);
      tempUser.setID(tempData["id"]);

      ListofUsers.add(tempUser);
    }

    setState(() {
      listUsers = ListofUsers;
    });
  }

  Future<void> addConversationtoFirebase(Conversation conversation) async {
    DatabaseReference database = FirebaseDatabase(
            databaseURL:
                "https://testproject-15c7c-default-rtdb.firebaseio.com")
        .reference();

    DatabaseReference conversationRef = database
        .child("conversations")
        .child(conversation.getConversationID().toString());

    await conversationRef.set(<String, String>{
      "userOne": conversation.userIDs[0].id,
      "userTwo": conversation.userIDs[1].id,
      "id": conversation.conversationID.toString(),
    });
  }
}
