import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estrutura de um app Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue[700],
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello World Devs!'),
        ),
      ),
    );
  },
}

class TelaAppBar extends StatelessWidget {
  const TelaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DEVS2BLU First App',
          style: TextStyle(color: Colors.white,[700]
          ),
        ),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Text(
          'E ai galera!!',
          style: TextStyle(fontSize: 20, color: Colors.blue[900],
          ),
        ),
      ),
    );
  },
}