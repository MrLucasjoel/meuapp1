/*import 'package:flutter/material.dart';
import 'package:meuapp/src/view/login_view.dart';
import 'package:meuapp/src/view/registro_view.dart';
import 'package:meuapp/src/view/home_view.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginView(),
        '/register': (_) => const RegistroView(),
        '/home': (_) => const HomeView(),
      },
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:meuapp/src/app/app_routes.dart';
import 'package:meuapp/src/theme/font_theme.dart';
import 'package:meuapp/src/theme/color_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(textTheme: FontTheme.textTheme),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
