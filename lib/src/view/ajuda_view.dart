import 'package:flutter/material.dart';

class AjudaView extends StatelessWidget {
  const AjudaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHelpItem(
              title: 'Como usar o aplicativo',
              description: 'Aqui você encontrará informações sobre como usar as funcionalidades do aplicativo.',
            ),
            _buildHelpItem(
              title: 'Suporte Técnico',
              description: 'Se você encontrar problemas técnicos, entre em contato com nosso suporte.',
            ),
            _buildHelpItem(
              title: 'Perguntas Frequentes',
              description: 'Consulte as perguntas mais frequentes para resolver suas dúvidas rapidamente.',
            ),
            // Adicione mais itens conforme necessário
          ],
        ),
      ),
    );
  }

  Widget _buildHelpItem({required String title, required String description}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}