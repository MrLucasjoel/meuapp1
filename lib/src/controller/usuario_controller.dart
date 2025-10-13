import 'package:shared_preferences/shared_preferences.dart';
import 'package:meuapp/src/service/registro_service.dart';
import 'package:meuapp/src/model/usuario_model.dart';
import 'dart:convert';

class UsuarioController {
  final RegistroService service = RegistroService();

  // Registra o usuário salvando no SQLite **e** no SharedPreferences
  Future<bool> registrarUsuario(UsuarioModel usuario) async {
    try {
      // Salva no banco SQLite
      await service.salvarUsuario(usuario.toJson());

      // Salva no SharedPreferences (último usuário logado)
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('usuario_registrado', jsonEncode(usuario.toJson()));
      await prefs.setString('usuario_logado', usuario.email);

      print('✅ Usuário salvo no banco e no SharedPreferences');
      return true;
    } catch (e) {
      print('❌ Erro ao registrar usuário: $e');
      return false;
    }
  }

  // Retorna o usuário logado (se existir)
  Future<UsuarioModel?> obterUsuarioLogado() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('usuario_registrado');

    if (jsonString == null) return null;

    final json = jsonDecode(jsonString);
    return UsuarioModel.fromJson(json);
  }
}

