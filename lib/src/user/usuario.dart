class Usuario {
  final String id;
  final String nome;
  final String email;
  final String senha;
  final bool isAdmin;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    this.isAdmin = false,
  });
}
