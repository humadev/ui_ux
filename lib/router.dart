import 'package:go_router/go_router.dart';
import 'package:ui_ux/home.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title: "UI App"),
    ),
  ],
);
