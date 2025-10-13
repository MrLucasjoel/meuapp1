import 'dart:convert';
import 'package:meuapp/src/service/registro_service.dart';
import 'package:meuapp/src/model/usuario_model.dart';
import 'package:meuapp/src/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final RegistroService _registroService;

  LoginController(this._registroService);

  Future<LoginModel?> autenticar(String email, String senha) async {
    final usuarios = await _registroService.listarUsuarios();

    if (usuarios.isEmpty) {
      print('⚠️ Nenhum usuário encontrado no banco.');
      return null;
    }

    for (var usuarioJson in usuarios) {
      final usuario = UsuarioModel.fromJson(Map<String, dynamic>.from(usuarioJson));

      if (usuario.email.trim() == email.trim() &&
          usuario.senha.trim() == senha.trim()) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('usuario_logado', usuario.email);

        print('✅ Login realizado com sucesso: ${usuario.email}');
        return LoginModel(
          //user: usuario.user,
          email: usuario.email,
          senha: usuario.senha,
          token: 'token_fake_123',
          expiry: DateTime.now().add(const Duration(hours: 1)),
        );
      }
    }

    print('❌ E-mail ou senha incorretos.');
    return null;
  }
}

/*import 'package:meuapp/src/model/login_model.dart';

class LoginController {
  Future<LoginModel?> autenticar(String user, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (user == "admin" && password == "12345") {
      return LoginModel(user: user, password: password);
    }
    return null;
  }
}*/