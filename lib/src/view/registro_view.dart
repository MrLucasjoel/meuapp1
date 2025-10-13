import 'package:flutter/material.dart';
import 'package:meuapp/src/theme/color_theme.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cepController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _numeroController = TextEditingController();
  final _cidadeController = TextEditingController();

  String? _ufSelecionado;
  String? _estadoCivilSelecionado;
  bool _loading = false;

  final List<String> _ufs = [
    'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA',
    'MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN',
    'RS','RO','RR','SC','SP','SE','TO'
  ];
  final List<String> _estadosCivis = [
    'Solteiro','Casado','Divorciado','Viúvo','União Estável'
  ];

  void _registrar() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            'Cadastro realizado com sucesso!'
        )),
      );
      Navigator.pop(context);
    });
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Cadastro'),
        backgroundColor: AppColors.background,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: _inputDecoration('Nome completo', Icons.person),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _cpfController,
                  decoration: _inputDecoration('CPF', Icons.badge),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration('E-mail', Icons.email),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _dataNascController,
                  decoration: _inputDecoration('Data de Nascimento', Icons.calendar_today),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _telefoneController,
                  decoration: _inputDecoration('Telefone Celular', Icons.phone),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _cepController,
                  decoration: _inputDecoration('CEP', Icons.location_on),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _enderecoController,
                  decoration: _inputDecoration('Endereço', Icons.home),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _numeroController,
                  decoration: _inputDecoration('Número', Icons.format_list_numbered),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _cidadeController,
                  decoration: _inputDecoration('Cidade', Icons.location_city),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: _ufSelecionado,
                  items: _ufs.map((uf) => DropdownMenuItem(value: uf, child: Text(uf))).toList(),
                  decoration: _inputDecoration('Estado (UF)', Icons.map),
                  onChanged: (v) => setState(() => _ufSelecionado = v),
                  validator: (v) => v == null ? 'Selecione um UF' : null,
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: _estadoCivilSelecionado,
                  items: _estadosCivis.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  decoration: _inputDecoration('Estado Civil', Icons.people),
                  onChanged: (v) => setState(() => _estadoCivilSelecionado = v),
                  validator: (v) => v == null ? 'Selecione um estado civil' : null,
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryVariant,
                    ),
                    onPressed: _loading ? null : _registrar,
                    child: _loading
                        ? const CircularProgressIndicator(
                    )
                        : const Text(
                        'Registrar',
                      style: TextStyle(
                          color: AppColors.secondary
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}