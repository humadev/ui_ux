import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_ux/home.dart';

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
            pageBuilder: (context, state) => const NoTransitionPage(
                child: Center(
                    child: Text(
              'No Conversation',
            ))),
          ),
          GoRoute(
            path: '/:id',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Conversation()),
          )
        ]),
  ],
);
