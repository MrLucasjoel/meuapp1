import 'package:meuapp/src/model/login_model.dart';
import 'package:meuapp/src/model/usuario_model.dart';
import 'package:meuapp/src/service/registro_service.dart';

class AuthService {
  final RegistroService _registroService;

  AuthService(this._registroService);

  Future<LoginModel?> autenticar(String email, String senha) async {
    // Busca todos os usuários salvos no banco
    final usuarios = await _registroService.listarUsuarios();

    try {
      // Tenta encontrar o usuário pelo e-mail e senha
      for (var usuarioJson in usuarios) {
        final usuario = UsuarioModel.fromJson(usuarioJson);

        // Verifica se as credenciais estão corretas
        if (usuario.email.trim() == email.trim() &&
            usuario.senha.trim() == senha.trim()) {
          print('✅ Login realizado com sucesso: ${usuario.email}');

          // Retorna o modelo de login completo
          return LoginModel(
            email: usuario.email,
            senha: usuario.senha,
            token: 'token_exemplo_123', // pode ser gerado dinamicamente se quiser
            expiry: DateTime.now().add(const Duration(hours: 1)), // expira em 1h
          );
        }
      }
    } catch (e) {
      print('❌ Erro ao autenticar usuário: $e');
    }

    // Retorna null se o usuário não for encontrado
    return null;
  }
}


