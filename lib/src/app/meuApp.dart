import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estrutura de um app Flutter',
      theme: ThemeData(
        primaryColorDark:const Color.fromARGB(255, 32, 106, 167)
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello World Devs!'),
        ),
      ),
    );
  }
}

class TelaAppBar extends StatelessWidget {
  const TelaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DEVS2BLU First App',
          style: TextStyle(color: Color.fromARGB(255, 0, 255, 85),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 54, 130, 244),
      ),
      body: Center(
        child: Text(
          'E ai galera!!',
          style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 33, 243, 61),
          ),
        ),
      ),
    );
  }
}