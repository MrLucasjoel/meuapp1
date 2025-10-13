import 'package:flutter/material.dart';
import 'package:meuapp/src/view/ajuda_view.dart';
import 'package:meuapp/src/view/configuracoes_view.dart';
import 'package:meuapp/src/view/login_view.dart';
import 'package:meuapp/src/view/perfil_view.dart';
import 'package:meuapp/src/view/registro_view.dart';
import 'package:meuapp/src/view/home_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String perfil = '/perfil';
  static const String configuracoes = '/configuracoes';
  static const String ajuda = '/ajuda';

  static Map<String, WidgetBuilder> get routes => {
    login: (_) => const LoginView(),
    register: (_) => const RegistroView(),
    home: (_) => const HomeView(),
    perfil: (_) => const PerfilView(),
    configuracoes: (_) => const ConfiguracoesView(),
    ajuda: (_) => const AjudaView(),
  };
}

