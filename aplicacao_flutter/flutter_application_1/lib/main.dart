import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/perfil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove a faixa de DEBUG
      debugShowCheckedModeBanner: false,

      //Home recebe nosso primeiro Wifget
      //que será exibido pelo aplicativo
      home: const PerfilScreen(),
    );
  }
}

