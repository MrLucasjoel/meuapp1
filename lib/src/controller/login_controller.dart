import 'package:meuapp/src/model/login_model.dart';

class LoginController {
  Future<LoginModel?> autenticar(String user, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (user == "admin" && password == "12345") {
      return LoginModel(user: user, password: password);
    }
    return null;
  }
}