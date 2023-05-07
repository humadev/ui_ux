import 'package:flutter/material.dart';

import '../../router.dart';
import 'chat_list_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: <Widget>[
        for (int i = 1; i < 30; i++) ...[
          ChatListTile(
            onTap: () {
              router.push('/$i');
            },
          )
        ]
      ],
    );
  }
}
