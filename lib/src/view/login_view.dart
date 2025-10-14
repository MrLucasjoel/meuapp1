import 'package:flutter/material.dart';
import 'package:meuapp/src/app/app_routes.dart';
import 'package:meuapp/src/controller/login_controller.dart';
import 'package:meuapp/src/service/registro_service.dart';
import 'package:meuapp/src/theme/color_theme.dart';
import 'package:meuapp/src/theme/font_theme.dart';
import 'package:meuapp/src/user/usuario_service.dart';
import 'package:meuapp/src/view/alteraSenha_view.dart';
import 'package:meuapp/src/view/registro_view.dart';
import 'package:meuapp/src/controller/login_controller.dart';
import 'package:meuapp/src/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController _controller;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _loading = false;
  String? _erro;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final registroService = RegistroService();
    _controller = LoginController(registroService);
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _erro = null;
    });

    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    // Login do ADMIN (fixo)
    if (email == "admin@nexti9.com" && senha == "admin123") {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.home);
      setState(() => _loading = false);
      return;
    }

    // Login de usuário normal
    final login = await _controller.autenticar(email, senha);

    if (login != null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      setState(() {
        _erro = "E-mail ou senha incorretos!";
      });
    }

    setState(() => _loading = false);
  }

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegistroView()),
    );
  }

  void _abrirAlteraSenha() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AlteraSenhaView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.skip_next_outlined,
                    size: 180,
                    color: AppColors.primaryVariant,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "NextI9",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.merge(AppFonts.headlineSmall)
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Bem-vindo",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Faça login para continuar",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),

                  // Campo e-mail
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: const Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: AppColors.primaryVariant),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Digite seu e-mail";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo senha
                  TextFormField(
                    controller: _senhaController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.secondary,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: AppColors.primaryVariant),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Digite sua senha";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  if (_erro != null)
                    Text(
                      _erro!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.secondary),
                    ),
                  const SizedBox(height: 24),

                  // Botão de login
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryVariant,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(
                        color: AppColors.secondary,
                        strokeWidth: 2,
                      )
                          : const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextButton(
                    onPressed: _abrirCadastro,
                    child: const Text(
                      "Não tem conta? Cadastre-se",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _abrirAlteraSenha,
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.secondary,
                      ),
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
