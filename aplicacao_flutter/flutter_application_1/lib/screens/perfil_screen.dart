import 'package:flutter/material.dart';
//Tela de perfil que representa o perfil

//StatelessWidget é usado quando as informações do proprio widget não precisa mmudar durante a interação
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold fornece a estrutura basica de uma tela Material Design
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu perfil',
          //Estilizando o nosso titulo
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        //Criando um espaço interno nos 4 lados
        padding: const EdgeInsets.all(16),
        //padding apenas 1 unico filho
        //Collumn será o filho por que precisamos organizar varios elementos vertical
        child: Column(
          //Em column, o eixo principla é VERTICAL
          //start coloca os filhos no inicio desse eixo: no topo
          mainAxisAlignment:MainAxisAlignment.start,
          
          //O eixo tranversal fica perpendicular.
          //Em column, ele deixa HORIZONTAL
          //stretch tenta ocupar a largura disponivel
          crossAxisAlignment: .stretch,
          children: [ const CircleAvatar(
            //radius que controla o raio do circulo 
            radius: 48,
            //Cor de fundo do avatar
            backgroundColor: Colors.blue,
            //recebe o conteudo interno 
            child: Icon(
              //recebe o icone
              Icons.person,
              //tamanho do icone
              size:60,
              //cor do icone
              color:Colors.white),
          )
        ],
        ),
      ),
    );
  }

}
