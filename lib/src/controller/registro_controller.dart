import 'package:flutter/material.dart';
import 'package:meuapp/src/model/registro_model.dart';

class RegistroController {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final dataNascController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final enderecoController = TextEditingController();
  final numeroController = TextEditingController();
  final cidadeController = TextEditingController();

  String? ufSelecionado;
  String? estadoCivilSelecionado;

  String? erro;

  UsuarioModel? validarEConstruirUsuario() {
    if (formKey.currentState!.validate()) {
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
        dataNascimento: dataNascController.text.trim(),
        telefone: telefoneController.text.trim(),
        cep: cepController.text.trim(),
        endereco: enderecoController.text.trim(),
        numero: numeroController.text.trim(),
        cidade: cidadeController.text.trim(),
        uf: ufSelecionado!,
        estadoCivil: estadoCivilSelecionado!,
      );
    }
    return null;
  }

  //Limpa todos os campos após o cadastro.
  void limparCampos() {
    nomeController.clear();
    cpfController.clear();
    emailController.clear();
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
