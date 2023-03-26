import 'package:flutter/material.dart';

import 'view/chat_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 730) {
        return DesktopScaffold(widget: widget);
      }
      return MobileScaffold(widget: widget);
    });
  }
}

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            for (int i = 0; i < 30; i++) ...[const ChatListTile()]
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
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: <Widget>[
              for (int i = 0; i < 30; i++) ...[const ChatListTile()]
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [TextField()],
          )
        ],
      ),
    );
  }
}
