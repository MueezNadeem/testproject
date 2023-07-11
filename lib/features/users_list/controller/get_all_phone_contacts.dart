import 'package:contacts_service/contacts_service.dart';

import '../../../common/models/user.dart';

Future<List<User>> getContacts(List<User> users) async {
  late List<Contact> _contacts;
  final Iterable<Contact> contacts =
      await ContactsService.getContacts(withThumbnails: false);
  List<User> regUsers = [];
  _contacts = contacts.toList();
  for (User user in users) {
    for (Contact contact in _contacts) {
      String ph = contact.phones!.first.value!;
      ph = ph.replaceAll(' ', '');
      String phWithoutCountryCode = ph.substring(1);
      phWithoutCountryCode = "+92$phWithoutCountryCode";

      if (user.id == ph || user.id == phWithoutCountryCode) {
        regUsers.add(user);
      }
    }
  }
  return regUsers;
}
