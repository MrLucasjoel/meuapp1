import 'package:meuapp/src/user/usuario.dart';

class UsuarioService {
  final List<Usuario> _usuarios = [];

  UsuarioService() {
    criarContaAdminFake();
  }

  /// Cria a conta admin padrão se ainda não existir
  void criarContaAdminFake() {
    final existe = _usuarios.any((u) => u.email == 'admin@nexti9.com');
    if (!existe) {
      final adminFake = Usuario(
        id: '01',
        nome: 'Boss Lucas Joel',
        email: 'admin@nexti9.com',
        senha: 'admin123', // adicionamos senha aqui!
        isAdmin: true,
      );
      _usuarios.add(adminFake);
      print('✅ Conta admin criada com sucesso!');
    } else {
      print('⚠️ Conta admin já existe.');
    }
  }

  /// Faz login comparando e-mail e senha
  Usuario? login(String email, String senha) {
    try {
      return _usuarios.firstWhere(
            (u) => u.email == email && u.senha == senha,
      );
    } catch (_) {
      return null; // retorna null se não achar
    }
  }

  /// Cadastra um novo usuário comum
  void registrarUsuario(Usuario usuario) {
    final existe = _usuarios.any((u) => u.email == usuario.email);
    if (existe) {
      throw Exception('E-mail já cadastrado!');
    }
    _usuarios.add(usuario);
  }

  List<Usuario> get usuarios => _usuarios;
}
