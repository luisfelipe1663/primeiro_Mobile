//importa a biblioteca material design do flutter
//essa bilioteca disponibiliza componentes visuais
// Scaffold, AppBar, Text, Column, Row, Icon, Container e outros
import 'package:flutter/material.dart';
//Tela de perfil que representa o perfil

//StatelessWidget é usado quando as informações do proprio widget não precisa mmudar durante a interação
class PerfilScreen extends StatelessWidget {
  //super.key encaminha a chave do widget para o construtor da class pai(StatelessWidget)
  const PerfilScreen({
    super.key,
  }); //A key ajuda o Flutter a identificar widgets durante a atualização da interface

  // @override indica que estamos sobrecrevendo um metodo que ja existe na classe pai
  @override
  //o metodo build é responsavel por construir a interface visual do widget
  //widget representa o tipo de retorno do metodo
  //BulidContext fornece informações sobre a posição do widget na arvore de widget
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
          mainAxisAlignment: MainAxisAlignment.start,

          //O eixo tranversal fica perpendicular.
          //Em column, ele deixa HORIZONTAL
          //stretch tenta ocupar a largura disponivel
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              //radius que controla o raio do circulo
              radius: 48,
              //Cor de fundo do avatar
              backgroundColor: Colors.blue,
              //recebe o conteudo interno
              child: Icon(
                //recebe o icone
                Icons.person,
                //tamanho do icone
                size: 60,
                //cor do icone
                color: Colors.white,
              ),
            ),

            SizedBox(height: 16), //espaçamento vertical

            const Text(
              'Luis Felipe',
              //alinhamento do Texto
              textAlign: TextAlign.center,
              //estilizando o Texto
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            const Text(
              'Desensolvedores de Software',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(
                16,
              ), // espaçamento interno(espaçamento dentro da nossa caixa)
              //Decorations controla a aparencia visual
              decoration: BoxDecoration(
                //cor de fundo
                color: Colors.deepPurple.shade50,
                //Arredonda os quatros cantos
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.email, size: 28),
                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-mail',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Luisfelipe.09062008@gmail.com'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
             margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone, size: 28),
                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TELEFONE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('11 967065726'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

                const Text('Tecnologias',
                style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Flutter'),
                Text('React'),
                Text('Node.js'),
              ]
              ) 
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                onPressed:(){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Editar perfil pressionado'
                      ),
                    ),
                    );

              },
              child: const Text('Editar perfil'),
              )
            )
          ],
        ),
      ),
    );
  }
}
