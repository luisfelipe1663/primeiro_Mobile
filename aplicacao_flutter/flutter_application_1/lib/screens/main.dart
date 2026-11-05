import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/perfil_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  //system usa a preferencia de aparencia do aparelho
  ThemeMode modoAtual = ThemeMode.system ;

  void alterarTema(ThemeMode novoModo){
    setState(() {
      modoAtual = novoModo;
    });
  }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme representa a configuração visual clara
      //ThemeData agrupa as configurações visuais
      theme:ThemeData(
        //colorScheme ele define a paleta de cores
        //ColorScreme.frondSeed ele gera as paletas apartit de uma cor base
        colorScheme: ColorScheme.fromSeed(
          //ele determina a principal cor da palet
          seedColor: Colors.teal,
          //gera as cores adequadas de acordo com o modo(claro ou escuro) 
          brightness: Brightness.light
        )
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark)
    ),
      //definir qual das  duas configurações sera usada
      //o valor do estad determina se MaterialApp usa theme ou darktheme
      themeMode: modoAtual,

      home: const PerfilScreen(),
    );
  }
}