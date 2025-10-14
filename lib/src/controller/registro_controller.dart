import 'package:flutter/material.dart';
import 'package:meuapp/src/model/usuario_model.dart';
import 'package:meuapp/src/service/registro_service.dart';

class RegistroController {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final dataNascController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final enderecoController = TextEditingController();
  final numeroController = TextEditingController();
  final cidadeController = TextEditingController();

  String? ufSelecionado;
  String? estadoCivilSelecionado;
  String? erro;

  final RegistroService service = RegistroService();

  // Registra o usuário
  Future<bool> registrarUsuario() async {
    final usuario = validarEConstruirUsuario();
    if (usuario == null) return false;

    try {
      // Converte para JSON antes de salvar
      await service.salvarUsuario(usuario.toJson());
      return true;
    } catch (e) {
      print('Erro ao salvar usuário: $e');
      erro = 'Erro ao salvar usuário: $e';
      print('Erro: $e');
      return false;
    }
  }

  // Valida os campos e constrói o modelo do usuário
  UsuarioModel? validarEConstruirUsuario() {
    if (formKey.currentState?.validate() != true) return null;

    if (ufSelecionado == null) {
      erro = "Selecione o estado (UF)";
      return null;
    }

    if (estadoCivilSelecionado == null) {
      erro = "Selecione o estado civil";
      return null;
    }

    return UsuarioModel(
      nomeCompleto: nomeController.text.trim(),
      cpf: cpfController.text.trim(),
      email: emailController.text.trim(),
      senha: senhaController.text.trim(),
      dataNasc: dataNascController.text.trim(),
      telefone: telefoneController.text.trim(),
      cep: cepController.text.trim(),
      endereco: enderecoController.text.trim(),
      numero: numeroController.text.trim(),
      cidade: cidadeController.text.trim(),
      uf: ufSelecionado!,
      estadoCivil: estadoCivilSelecionado!,
    );
  }

  // Limpa todos os campos
  void limparCampos() {
    nomeController.clear();
    cpfController.clear();
    emailController.clear();
    senhaController.clear();
    dataNascController.clear();
    telefoneController.clear();
    cepController.clear();
    enderecoController.clear();
    numeroController.clear();
    cidadeController.clear();
    ufSelecionado = null;
    estadoCivilSelecionado = null;
    erro = null;
  }
}
