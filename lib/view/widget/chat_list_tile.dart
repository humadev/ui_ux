import 'package:flutter/material.dart';

import '../../models/contact.dart';
import '../../router.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(this.contact, {super.key});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListTile(
        onTap: () {
          router.push("/${contact.id}");
        },
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage(contact.photo),
        ),
        title:
            Text(contact.name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          contact.lastChat,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).hintColor),
        ),
        trailing: Column(
          children: [
            Text(contact.lastChatTime,
                style: Theme.of(context).textTheme.labelSmall),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary),
              padding: EdgeInsets.all(4),
              child: Text("5",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      );
    });
  }
}
