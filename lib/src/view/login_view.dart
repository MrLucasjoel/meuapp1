import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meuapp/src/controller/login_controller.dart';
import 'package:meuapp/src/view/registro_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = LoginController();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _carregando = false;
  String? _erro;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _carregando = true);

      final usuario = await _controller.autenticar(
        _userController.text,
        _passwordController.text,
      );

      setState(() => _carregando = false);

      if (usuario != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', usuario.user);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bem-vindo, ${usuario.user}!')),
        );

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() => _erro = 'Usuário ou senha inválidos');
      }
    }
  }

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegistroView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _userController,
                    decoration: const InputDecoration(labelText: 'Usuário / Email'),
                    validator: (v) => v == null || v.isEmpty ? 'Informe o usuário' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (v) => v == null || v.isEmpty ? 'Informe a senha' : null,
                  ),
                  const SizedBox(height: 20),
                  _carregando
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _abrirCadastro,
                    child: const Text('Não tem conta? Cadastre-se'),
                  ),
                  if (_erro != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        _erro!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
