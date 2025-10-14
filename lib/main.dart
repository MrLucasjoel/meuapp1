import 'package:flutter/material.dart';
import 'package:meuapp/src/app/app_widget.dart';
import 'package:meuapp/src/user/usuario_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Opcional: se quiser limpar o banco antes
  // final dbHelper = DatabaseHelper();
  // await dbHelper.resetarBanco();

  final usuarioService = UsuarioService(); // cria e já adiciona admin
  usuarioService.criarContaAdminFake(); // garante que admin exista

  runApp(const AppWidget());
}