import 'package:flutter/material.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  //final indica que a variavel produtos não recebera outra lista depois de criada
  final List<String> produtos = const [
    'Notebook',
    'Celular',
    'Tablet',
    'Monitor',
    'Teclado',
    'Mouse',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('categoria')),
      //adiciona um espaçamento interno ao redor do conteudo
      body: Padding(
        //define 16 pixels logicos de espaço em todos os lados
        padding: const EdgeInsets.all(16),

        //Organiza os widgets verticalmente, de cima para baixo
        child: Column(
          //faz os filhos ocuparem toda a largura disponivel no eixo horizontal da coluna
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //Lista os widgets que serão exibidos na coluna
            const Text(
              'Lista de produtos',
              style: TextStyle(
                fontSize: 18, // Define o tamanho da fonte 
               fontWeight: FontWeight.bold // Deixa o texto em negrito
               ),
            ),
              //Cria um espaço vertical 
            const SizedBox(height: 8),

              //Faz a lista ocupar o espaço vertical disponível dentro da column,  considerando os outros elementos 
            Expanded(
              //Cria uma lista vertical com rolagem.
              //bulder constroi os itens conforme o necessário,sendo util para listas que podem ter muitos elementos 
              child: ListView.builder(
                //definindo a quatidade de itens
                //produtos.lenght retorna 6 neste exemplo
                itemCount: produtos.length,
                
                //função chamada pelo ListView para construir cada item da lista
                //index representa a posição do item, começando em 0
                itemBuilder: (context,index){
                  //Cria um cartão visual ao redor de cada produto
                  return Card(
                    //adiciona 4 pixel de margem acima e abaixo do cartão
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    //cria uma linha pronta para listas,com espaço para icone, titulo e informações adicionais 
                    child: ListTile(
                      //Exibe um icone de sacola no inicio da linha 
                      leading: const Icon(Icons.shopping_bag_outlined),
                      //Exibe p nome do produto
                      title: Text(produtos[index]),
                      //Exibe uma descrição abaixo do nome 
                      //${index + 1} interpola o valor calculado 
                      //como o indice começa em 0, os numeros começam em um
                      subtitle: Text('produto ${index + 1}'),

                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20,),

            const Text('Grade de produtos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),

            const SizedBox(height: 8,),
            //Faz a grade ocupar parte do espaço vertical restante
            //Como há dois expanded na mesma column, o espaço flexivel é dividido igualmente entre eles, após descontar os demais elementos e os espaçamentos  
            Expanded(
              //Ele cria uma grade com rolagem, organizando os itens em linhas e colunas 
              child: GridView.builder(
                itemCount: produtos.length,

                //Define que serão exibidos 6 itens na grade
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //Exibe duas colunas por linhas
                  crossAxisCount: 2,
                  //define 10 pixels logicos de espaço horizontal entre as colunas
                  crossAxisSpacing: 10,
                  //define 10 pixels logicos de espaço vertical entre as colunas
                  mainAxisSpacing: 10,
                  //define a proporção entre largura e altura de cada item
                  //1.6 significa que cada item será aproximadamente 1.6 vezes mais largo do que alto
                  childAspectRatio: 1.6
                  ),
                  //construi cada elemento da grade 
                  //indes identifica o produto atual
                  itemBuilder: (context,index){
                    //cria uma caixa que pode receber alinhamento, cor, bordas, margens internas e outros estilosa
                    return Container(
                      //centraliza o conteudo dentro da caixa
                      //tanto vertical quanto horixontal
                      alignment: Alignment.center,
                      //defina a aparência visual do container 
                      decoration: BoxDecoration(
                        //defina uma cor para o fundo 
                        color: Colors.deepPurple.shade50,
                       //arredonda os cantos da caixa com raio de 12  pixels logicos
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        //exibe o nome do produto correspondente ao indice
                        produtos[index],
                        //centraliza o texto horizontalmente
                        textAlign: TextAlign.center,
                        ),
                    );
                  },
              )

              )
          ],
        ),
      ),
    );
  }
}
