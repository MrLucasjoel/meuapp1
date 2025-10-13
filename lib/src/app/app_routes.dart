import 'package:flutter/material.dart';
import 'package:meuapp/src/view/configuracoes_view.dart';
import 'package:meuapp/src/view/login_view.dart';
import 'package:meuapp/src/view/perfil_view.dart';
import 'package:meuapp/src/view/registro_view.dart';
import 'package:meuapp/src/view/home_view.dart';
import 'package:meuapp/src/widget/bottom_nav.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String perfil = '/perfil';
  static const String configuracoes = '/configuracoes';
  static const bottomNav = '/bottom';

  static Map<String, WidgetBuilder> get routes => {
    login: (_) => const LoginView(),
    register: (_) => const RegistroView(),
    home: (_) => const HomeView(),
    perfil: (_) => const PerfilView(),
    configuracoes: (_) => const ConfiguracoesView(),
    bottomNav: (_) => const  MeuBottomNavigationBar(),

  };
}

