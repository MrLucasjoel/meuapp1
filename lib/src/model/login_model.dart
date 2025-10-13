class LoginModel {
  //final String user;
  final String senha;
  final String email;
  final String token; // Pode ser útil se você estiver usando autenticação baseada em token
  final DateTime expiry; // Para armazenar a data de expiração do token, se aplicável

  // Construtor
  LoginModel({
    //required this.user,
    required this.senha,
    required this.email,
    required this.token,
    required this.expiry,
  });

  // Metodo para converter o objeto em um formato JSON, se necessário
  Map<String, dynamic> toJson() {
    return {
      //'user': user,
      'senha':senha,
      'email': email,
      'token': token,
      'expiry': expiry.toIso8601String(),
    };
  }

  // Metodo para criar um LoginModel a partir de JSON
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      //user: json['user'],
      senha: json['senha'],
      email: json['email'],
      token: json['token'],
      expiry: DateTime.parse(json['expiry']),
    );
  }
}