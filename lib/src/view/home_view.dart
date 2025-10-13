import 'package:flutter/material.dart';
import 'package:meuapp/src/app/app_menu.dart';
import 'package:meuapp/src/app/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

Future<void> carregarUsuario() async {
  final prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('usuario_logado');
  print('Usuário logado: $email');
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const MeuDrawer(), // Usando o MeuDrawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo à Home!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}