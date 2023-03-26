import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      contentPadding: const EdgeInsets.all(12),
      leading: CircleAvatar(
        backgroundImage: AssetImage("person.webp"),
      ),
      title:
          Text("Huma Prathama", style: Theme.of(context).textTheme.titleMedium),
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
  }
}
