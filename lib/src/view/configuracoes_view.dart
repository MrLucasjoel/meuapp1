import 'package:flutter/material.dart';

class ConfiguracoesView extends StatelessWidget {
  const ConfiguracoesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tela de Configurações",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
