import 'package:flutter/material.dart';
import 'package:meuapp/src/app/app_routes.dart';
import 'package:meuapp/src/theme/color_theme.dart';
import 'package:meuapp/src/view/registro_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;
  String? _erro;

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _loading = false);

      if (_emailController.text == "admin" && _passwordController.text == "12345") {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        setState(() => _erro = "Usuário ou senha inválidos");
      }
    });
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
      backgroundColor: AppColors.background, // Usando cor do color_theme.dart
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
                    Icons.lock,
                    size: 100,
                    color: AppColors.primary,
                  ), // Usando cor do color_theme.dart
                  const SizedBox(height: 24),
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

                  /*
                  -- email --
                   */
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: const Icon(Icons.email),

                      /* quando o foco não está no campo a borda é cinza */
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.gray), // borda quando NÃO focado
                      ),

                      /* quando focar no campo a borda muda de cor */
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary), // borda QUANDO focado
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /*
                  -- senha --
                   */
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: const Icon(Icons.lock),

                      /* quando o foco não está no campo a borda é cinza */
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.gray), // borda quando NÃO focado
                      ),

                      /* quando focar no campo a borda muda de cor */
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary), // borda QUANDO focado
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_erro != null)
                    Text(
                      _erro!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.secondary),
                    ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _login,
                      style: ElevatedButton.styleFrom(
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
                              color: AppColors.secondary
                          )
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
                          color: AppColors.secondary
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
