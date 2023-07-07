import 'package:firebase_database/firebase_database.dart';

Future<List<String>?> getChats(username) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  DataSnapshot snapshot = await ref.child('users/' + username + '/chats').get();
  Map<dynamic, dynamic>? chats = snapshot.value as Map<dynamic, dynamic>?;
  if (chats == null) {
    return [];
  } else {
    return chats.keys.cast<String>().toList();
  }
}
