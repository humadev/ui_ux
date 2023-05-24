import 'package:flutter/material.dart';

import '../../models/contact.dart';
import '../../router.dart';
import 'chat_list_tile.dart';
import 'data.dart';

class ChatList extends StatefulWidget {
  const ChatList({
    super.key,
  });

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  String _displayStringForContact(Contact contact) => contact.name;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(height: 80),
          child: Autocomplete<Contact>(
            onSelected: (Contact option) {
              setState(() {
                chatList.add(option);
              });
              router.push("/${option.id}");
            },
            displayStringForOption: _displayStringForContact,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable.empty();
              }

              return contacts.where((contact) {
                return contact
                    .toString()
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
          ),
        ),
        ...chatList.map(
          (Contact contact) {
            return ChatListTile(contact);
          },
        )
      ],
    );
  }
}
