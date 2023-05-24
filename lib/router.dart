import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_ux/extensions.dart';
import 'package:ui_ux/home.dart';
import 'package:ui_ux/view/widget/chat_list.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            HomePage(title: "Let's Talk", child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage(
                child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.isDesktop) {
                return const Center(
                  child: Text('No Conversation'),
                );
              } else {
                return const ChatList();
              }
            })),
          ),
          GoRoute(
              path: '/:id',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: Conversation(state.params['id']))),
        ]),
  ],
);
