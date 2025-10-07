import 'package:flutter/material.dart';
import 'package:meuapp/src/controller/registro_controller.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final _controller = RegistroController();
  bool _carregando = false;

  final List<String> _ufs = [
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES',
    'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR',
    'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
    'SP', 'SE', 'TO',
  ];

  final List<String> _estadosCivis = [
    'Solteiro',
    'Casado',
    'Divorciado',
    'Viúvo',
    'União Estável'
  ];

  void _registrar() {
    FocusScope.of(context).unfocus();
    setState(() => _carregando = true);

    final usuario = _controller.validarEConstruirUsuario();

    setState(() => _carregando = false);

    if (usuario != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      _controller.limparCampos();
      Navigator.pop(context);
    } else if (_controller.erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_controller.erro!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
        backgroundColor: const Color(0xFF206AA7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Nome completo
              TextFormField(
                controller: _controller.nomeController,
                decoration: const InputDecoration(labelText: "Nome completo"),
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // CPF
              TextFormField(
                controller: _controller.cpfController,
                decoration: const InputDecoration(labelText: "CPF"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // Email
              TextFormField(
                controller: _controller.emailController,
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Campo obrigatório";
                  if (!value.contains("@")) return "E-mail inválido";
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Data de nascimento
              TextFormField(
                controller: _controller.dataNascController,
                decoration:
                const InputDecoration(labelText: "Data de Nascimento"),
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // Telefone
              TextFormField(
                controller: _controller.telefoneController,
                decoration:
                const InputDecoration(labelText: "Telefone Celular"),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // CEP
              TextFormField(
                controller: _controller.cepController,
                decoration: const InputDecoration(labelText: "CEP"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // Endereço
              TextFormField(
                controller: _controller.enderecoController,
                decoration: const InputDecoration(labelText: "Endereço"),
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // Número
              TextFormField(
                controller: _controller.numeroController,
                decoration: const InputDecoration(labelText: "Número"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // Cidade
              TextFormField(
                controller: _controller.cidadeController,
                decoration: const InputDecoration(labelText: "Cidade"),
                validator: (value) =>
                value == null || value.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 10),

              // UF
              DropdownButtonFormField<String>(
                value: _controller.ufSelecionado,
                decoration: const InputDecoration(labelText: "Estado (UF)"),
                items: _ufs
                    .map((uf) => DropdownMenuItem(
                  value: uf,
                  child: Text(uf),
                ))
                    .toList(),
                onChanged: (valor) {
                  setState(() => _controller.ufSelecionado = valor);
                },
                validator: (value) =>
                value == null ? "Selecione um estado" : null,
              ),
              const SizedBox(height: 10),

              // Estado civil
              DropdownButtonFormField<String>(
                value: _controller.estadoCivilSelecionado,
                decoration: const InputDecoration(labelText: "Estado civil"),
                items: _estadosCivis
                    .map((ec) => DropdownMenuItem(
                  value: ec,
                  child: Text(ec),
                ))
                    .toList(),
                onChanged: (valor) {
                  setState(() => _controller.estadoCivilSelecionado = valor);
                },
                validator: (value) =>
                value == null ? "Selecione o estado civil" : null,
              ),
              const SizedBox(height: 20),

              // Botão de Cadastrar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF206AA7),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _carregando ? null : _registrar,
                child: _carregando
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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