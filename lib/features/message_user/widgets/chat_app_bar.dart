import 'package:flutter/material.dart';

import '../../../common/models/chat.dart';

PreferredSizeWidget chatAppBar(Chat chat) {
  return AppBar(
    title: Text(chat.recipient),
  );
}
