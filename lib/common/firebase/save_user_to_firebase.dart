import 'package:firebase_database/firebase_database.dart';

Future<void> saveUsertoFireBase(name, phone) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  await ref.child("users").child(phone).set({
    "name": name,
  });
}
