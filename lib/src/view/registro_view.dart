import 'package:flutter/material.dart';
import 'package:meuapp/src/controller/registro_controller.dart';
import 'package:meuapp/src/model/usuario_model.dart';
import 'package:meuapp/src/theme/color_theme.dart';
import 'package:meuapp/src/user/usuario.dart';
import 'package:meuapp/src/utils/input_formatters.dart'; // Para CPF, CEP, Telefone

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final _formKey = GlobalKey<FormState>();
  late RegistroController _controller;

  bool _loading = false;

  final List<String> _ufs = [
    'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA',
    'MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN',
    'RS','RO','RR','SC','SP','SE','TO'
  ];

  final List<String> _estadosCivis = [
    'Solteiro','Casado','Divorciado','Viúvo','União Estável'
  ];

  @override
  void initState() {
    super.initState();
    _controller = RegistroController();
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
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.nomeController,
                  decoration: _inputDecoration('Nome completo', Icons.person),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.cpfController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [CpfInputFormatter()],
                  decoration: _inputDecoration('CPF', Icons.badge),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('E-mail', Icons.email),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.senhaController,
                  obscureText: true,
                  decoration: _inputDecoration('Senha', Icons.lock),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.dataNascController,
                  keyboardType: TextInputType.datetime,
                  decoration: _inputDecoration('Data de Nascimento', Icons.calendar_today),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.telefoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [TelefoneInputFormatter()],
                  decoration: _inputDecoration('Telefone Celular', Icons.phone),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [CepInputFormatter()],
                  decoration: _inputDecoration('CEP', Icons.location_on),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.enderecoController,
                  decoration: _inputDecoration('Endereço', Icons.home),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.numeroController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('Número', Icons.format_list_numbered),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _controller.cidadeController,
                  decoration: _inputDecoration('Cidade', Icons.location_city),
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: _controller.ufSelecionado,
                  items: _ufs.map((uf) => DropdownMenuItem(value: uf, child: Text(uf))).toList(),
                  decoration: _inputDecoration('Estado (UF)', Icons.map),
                  onChanged: (v) => setState(() => _controller.ufSelecionado = v),
                  validator: (v) => v == null ? 'Selecione um UF' : null,
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: _controller.estadoCivilSelecionado,
                  items: _estadosCivis.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  decoration: _inputDecoration('Estado Civil', Icons.people),
                  onChanged: (v) => setState(() => _controller.estadoCivilSelecionado = v),
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
                    onPressed: _loading
                        ? null
                        : () async {
                      setState(() => _loading = true);
                      final sucesso = await _controller.registrarUsuario();
                      if (sucesso) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
                        );
                        _controller.limparCampos();
                        Navigator.pop(context); // volta para login
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(_controller.erro ?? 'Erro ao cadastrar')),
                        );
                      }
                      setState(() => _loading = false);
                    },
                    child: _loading
                        ? const CircularProgressIndicator(color: AppColors.secondary)
                        : const Text('Cadastrar', style: TextStyle(color: AppColors.secondary)),
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

