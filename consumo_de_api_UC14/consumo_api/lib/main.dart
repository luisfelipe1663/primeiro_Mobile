//importa a biblioteca dart:convert, essa biblioteca permite converter informações entre JSON, String e outros formatos de dados
import 'dart:convert';
import 'package:flutter/material.dart';

//importa a biblioteca HTTP
//ela permite realizar requisições para APIs REST.
//O apelido 'http' facilita o acesso aos metodos:http.get(), http.post, http.put, http.delete()
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

//Stateleswidget representa um widget que não possui estado interno mutavel gerenciado por ele
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove a faixa vermelha de DEBUG exibida durante o desenvolmento
      debugShowCheckedModeBanner: false,
      title: 'Consumindo API REST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3 = true,
      ),

      home: const TelaPostagens(),
    );
  }
}

//classe que representa uma postagem da API
class Postagem {
  final int userId;
  final int id;
  final String title;
  final String body;

  //construtor da classe
  Postagem({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  //converte um objeto JSON em um objeto Postagem
  factory Postagem.fromJson(Map<String, dynamic> json) {
    return Postagem(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

//tela que apresenta a lista de postagem
class TelaPostagens extends StatefulWidget {
  const TelaPostagens({super.key});

  @override
  State<TelaPostagens> createState() => _TelaPostagensState();
}

class _TelaPostagensState extends State<TelaPostagens> {
  //armazena o resultado futuro da consulta
  late Future<List<Postagem>> postagens;

  @override
  void initState() {
    super.initState();
    //inicia a requisição a API
    postagens = buscarPostagens();
  }

  //Funçã assincrona para consultar a API
  Future<List<Postagem>> buscarPostagens() async {
    //define o endereço da API

    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts'
    );
    //realiza uma requisição HTTP do tipo GET
    final responta = await http.get(url).timeout(
      const Duration(seconds: 15),
    );

    if(responta.statusCode == 200){
      final List<dynamic> dados = jsonDecode(
        utf8.decode(responta.bodyBytes),
      );
      return dados.map((item){
        return Postagem.fromJson(
          item as Map<String,dynamic>,
        );
      }).toList();
    }else{
      throw Exception('erro http:${responta.statusCode}',);
    }
  }

  void atualizarPostagens(){
    setState(() {
      postagens = buscarPostagens();
    });
  }

  @override
 Widget build(BuildContext context){
  return Scaffold();
 }
}
