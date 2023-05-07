import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_ux/router.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage("person.webp"),
        ),
        title: Text("Huma Prathama",
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          "Reprehenderit eiusmod sunt incididunt nostrud eiusmod cupidatat.",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).hintColor),
        ),
        trailing: Column(
          children: [
            Text("23.10", style: Theme.of(context).textTheme.labelSmall),
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
