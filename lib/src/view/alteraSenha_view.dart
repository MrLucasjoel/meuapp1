import 'package:flutter/material.dart';
import 'package:meuapp/src/theme/color_theme.dart';

class AlteraSenhaView extends StatefulWidget {
  const AlteraSenhaView({super.key});

  @override
  State<AlteraSenhaView> createState() => _AlteraSenhaViewState();
}

class _AlteraSenhaViewState extends State<AlteraSenhaView> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _senhaAtual;
  String? _novaSenha;
  String? _confirmaNovaSenha;

  bool _senhaAtualVisivel = false;
  bool _novaSenhaVisivel = false;
  bool _confirmaNovaSenhaVisivel = false;

  void _alterarSenha() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha alterada com sucesso!')),
      );
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: AppColors.background,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Alterar Senha'),
          backgroundColor: AppColors.background),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// Campo de E-mail
              TextFormField(
                decoration: _inputDecoration('E-mail', Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu e-mail';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              const SizedBox(height: 12),

              /// Campo Senha Atual
              TextFormField(
                decoration: _inputDecoration(
                  'Senha Atual', Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaAtualVisivel
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _senhaAtualVisivel = !_senhaAtualVisivel;
                      });
                    },
                  ),
                ),
                obscureText: !_senhaAtualVisivel,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua senha atual';
                  }
                  return null;
                },
                onSaved: (value) => _senhaAtual = value,
              ),
              const SizedBox(height: 12),

              /// Campo Nova Senha
              TextFormField(
                decoration: _inputDecoration(
                  'Nova Senha', Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _novaSenhaVisivel
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _novaSenhaVisivel = !_novaSenhaVisivel;
                      });
                    },
                  ),
                ),
                obscureText: !_novaSenhaVisivel,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite uma nova senha';
                  }
                  return null;
                },
                onSaved: (value) => _novaSenha = value,
              ),
              const SizedBox(height: 12),

              /// Campo Confirma Nova Senha
              TextFormField(
                decoration: _inputDecoration(
                  'Confirme a Nova Senha', Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmaNovaSenhaVisivel
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmaNovaSenhaVisivel =
                        !_confirmaNovaSenhaVisivel;
                      });
                    },
                  ),
                ),
                obscureText: !_confirmaNovaSenhaVisivel,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme a nova senha';
                  } else if (value != _novaSenha) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
                onSaved: (value) => _confirmaNovaSenha = value,
              ),
              const SizedBox(height: 20),

              /// Botão Alterar Senha
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                      backgroundColor: AppColors.primaryVariant,
                  ),
                  onPressed: () {
                    _formKey.currentState!.save();
                    _alterarSenha();
                  },
                  child: const Text(
                    'Alterar Senha',
                    style: TextStyle(fontSize: 16,
                        color: AppColors.secondary
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

