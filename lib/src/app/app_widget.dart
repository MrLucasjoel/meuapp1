import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meuapp/src/view/login_view.dart';
import 'package:meuapp/src/view/registro_view.dart';
import 'package:meuapp/src/view/home_view.dart';

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  String _initialRoute = '/login';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _verificarLogin();
  }

  Future<void> _verificarLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user_email');

    setState(() {
      _initialRoute = (user != null && user.isNotEmpty) ? '/home' : '/login';
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _initialRoute,
      routes: {
        '/login': (_) => const LoginView(),
        '/register': (_) => const RegistroView(),
        '/home': (_) => const HomeView(),
      },
    );
  }
}
