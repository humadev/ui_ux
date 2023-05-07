import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_ux/router.dart';

import 'view/widget/chat_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 730) {
        return DesktopScaffold(widget: this);
      }
      return MobileScaffold(widget: this);
    });
  }
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int conversationId = 0;

  setConversation(int i) {
    setState(() {
      conversationId = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => setConversation(0),
        ),
        title: Text(widget.widget.title),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: conversationId > 0
            ? Conversation()
            : ListView(
                children: <Widget>[
                  for (int i = 1; i < 30; i++) ...[
                    ChatListTile(
                      onTap: () {
                        setConversation(i);
                      },
                    )
                  ]
                ],
              ),
      ),
    );
  }
}

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: <Widget>[
              for (int i = 0; i < 5; i++) ...[
                ChatListTile(
                  onTap: () {
                    router.go("/:$i");
                  },
                )
              ]
            ],
          ),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}

class Conversation extends StatelessWidget {
  const Conversation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConversationHeader(),
        Expanded(
            child: ListView(
          reverse: true,
          children: <ConversationItem>[
            ConversationItem(
              me: false,
            ),
            ConversationItem(
              me: true,
            ),
            ConversationItem(
              me: false,
            )
          ],
        )),
        ConversationInputBox()
      ],
    );
  }
}

class ConversationHeader extends StatelessWidget {
  const ConversationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.secondaryContainer,
      title: Text('Huma Prathama'),
      subtitle: Text('online'),
      leading: CircleAvatar(
        backgroundImage: AssetImage("person.webp"),
      ),
    );
  }
}

class ConversationInputBox extends StatelessWidget {
  const ConversationInputBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
                prefix: IconButton(
                    onPressed: () {}, icon: Icon(Icons.attach_file_rounded)),
                filled: true,
                hintText: 'Message',
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
          )),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
            child: IconButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {},
                icon: Icon(Icons.send_rounded)),
          )
        ],
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final bool me;

  const ConversationItem({super.key, required this.me});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Align(
        alignment: me ? Alignment.topRight : Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.6),
            child: Card(
              color: me
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Commodo commodo consequat non ipsum velit enim quis in. Veniam irure reprehenderit do exercitation dolore dolor nulla. Sunt dolore pariatur proident eu aliqua ullamco voluptate consequat incididunt eiusmod pariatur dolor exercitation ad. Occaecat do enim enim anim ullamco exercitation aute excepteur.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: me
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '20:00',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color: me
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
