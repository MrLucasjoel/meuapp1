import 'package:flutter/material.dart';
import 'package:meuapp/src/model/registro_model.dart';
import 'package:meuapp/src/service/registro_service.dart';
import 'package:meuapp/src/model/usuario_model.dart' hide UsuarioModel;

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
  final RegistroService service = RegistroService();

  String? ufSelecionado;
  String? estadoCivilSelecionado;

  String? erro;

  Future<bool> registrarUsuario() async {
    final usuario = validarEConstruirUsuario();
    if (usuario == null) return false;

    await service.salvarUsuario(usuario.toJson());
    return true;
  }



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
        senha: senhaController.text.trim(),
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