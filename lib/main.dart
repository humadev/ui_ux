import 'package:flutter/material.dart';
import 'package:ui_ux/router.dart';
import 'package:ui_ux/shared/color_schemes.g.dart';
import 'package:ui_ux/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: const AppTheme(lightColorScheme).toThemeData(),
        darkTheme: const AppTheme(darkColorScheme).toThemeData(),
        themeMode: ThemeMode.system,
        routerConfig: router);
  }
}
