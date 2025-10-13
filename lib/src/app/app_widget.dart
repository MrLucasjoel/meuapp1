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
import 'package:meuapp/src/view/home_view.dart';
import 'package:meuapp/src/theme/font_theme.dart';
import 'package:meuapp/src/theme/color_theme.dart';
import 'package:meuapp/src/view/login_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
          useMaterial3: true, // aqui! ativa o Material 3
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: TextTheme(
            headlineSmall: AppFonts.headlineSmall,
            bodyMedium: AppFonts.body,
            labelLarge: AppFonts.button,
          ), // usa o font_theme.dart
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginView(),
        //AppRoutes.bottomNav: (context) => const MeuBottomNavigationBar(),
        AppRoutes.home: (context) => const HomeView(),

      },
    );
  }
}
