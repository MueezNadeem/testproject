import 'package:firebase_database/firebase_database.dart';
import 'package:testproject/common/models/user.dart';

Future<List<User>> getAllUsers() async {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();
  DataSnapshot snapshot = await ref.child('users').get();

  Map<dynamic, dynamic>? usersMap = snapshot.value as Map<dynamic, dynamic>?;
  if (usersMap == null) {
    return [];
  } else {
    List<User> usersList = usersMap.entries.map((entry) {
      String userID = entry.key.toString();
      Map<dynamic, dynamic> data = entry.value as Map<dynamic, dynamic>;

      User user = User();
      user.id = userID;
      user.name = data['name'].toString();
      return user;
    }).toList();
    return usersList;
  }
}
