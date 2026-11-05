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

    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    //realiza uma requisição HTTP do tipo GET
    final responta = await http.get(url).timeout(const Duration(seconds: 15));

    if (responta.statusCode == 200) {
      final List<dynamic> dados = jsonDecode(utf8.decode(responta.bodyBytes));
      return dados.map((item) {
        return Postagem.fromJson(item as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('erro http:${responta.statusCode}');
    }
  }

  void atualizarPostagens() {
    setState(() {
      postagens = buscarPostagens();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postagens da API'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: atualizarPostagens,
          ),
        ],
      ),
      body: FutureBuilder<List<Postagem>>(
        future: postagens,
        //snapshot contem informações sobre o estado e o resultado do Future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 50, color: Colors.red),
                  const SizedBox(height: 12),
                  const Text('Erro ao carregar as postagens'),
                  const SizedBox(height: 8),
                  Padding(padding: const EdgeInsets.all(16),
                  child: Text(
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                  )
                  ),

                  ElevatedButton(
                    onPressed: atualizarPostagens,
                     child: const Text(
                      'Tentar novamente'
                      )
                     ),
                ],
              ),
            );

          }
          final lista = snapshot.data ?? [];
            if(lista.isEmpty){
              return const Center(
                child: Text(
                  'Nenhuma postagem encontrada.'
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: lista.length,
              itemBuilder: (context, index){
                final postagem = lista[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Postagem #${postagem.id}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        postagem.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          postagem.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Align(alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> TelaDetalhes(
                                  postagem:postagem
                                  ),
                                ),
                                );
                          },
                          child: const Text('Ver detalhes'),
                        ),
                        ),
                    ],
                    ),
                    ),
                );
              },
            );
        },
      ),
    );
  }
}

class TelaDetalhes extends StatelessWidget{
  final Postagem postagem;

  const TelaDetalhes({
    super.key,
    required this.postagem,
  });
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da postagem'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'postagem #${postagem.id}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              ),
              const SizedBox(height: 16),
              Text(postagem.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold 
              ),
              ),
              const SizedBox(height: 20),
              Text(
                postagem.body,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.5
                ),
              ),
              const SizedBox(height: 24),
              Text('Publicado pelo usuario:${postagem.userId}',
               style: const TextStyle(
                 color: Colors.grey,
                ),
              )
          ],
        ),
      ),
    );
  }
}