import 'package:flutter/material.dart';

class EventsScreen  extends StatefulWidget{
  const EventsScreen({super.key});

@override
  
  State<EventsScreen> createState(){
    return _EventsScreenState();
  }
}

class _EventsScreenState extends State<EventsScreen>{

//variavel para guardar o texto digitado
String textoDigitado = '';

//variaveis para aparecer antes da primeira ação
String mensagemEnviada = 'Nenhuma mensagem enviada';
String ultimoEvento = 'Nenhuma interação feita';

int toques = 0;
int toquesDuplos = 0;
int toquesLongos = 0;

void atualizarTexto(String novoTexto){
  setState(() {
    textoDigitado = novoTexto;
    ultimoEvento = 'onChanged: Texto alterado';
  });
//mostra no console o texto atualizado
debugPrint("texto digitado: $textoDigitado");
}

void enviarMensagem(String valor){
  //final impede retribuir esta variavel local
  //.trim() remove os espaços das extremidades
  final mensagem = valor.trim();
  setState(() {
    //isEmpty é true(se a mensagem estiver vazio entao)
    if(mensagem.isEmpty){
      mensagemEnviada = 'obrigatorio digitar uma mensagem';
    }else{
      //se hover conteudo, registra a mensagem.
      mensagemEnviada = mensagem;
    }

    ultimoEvento ='onSubmitted: envio solicitado';
  });

}

void finalizarEdicao(){

  //FocusScope gerencia qual campo está em foco
  //unfocus remove o foco atual e normalmente faz o teclado virtual desaparecer
  FocusScope.of(context).unfocus();
}

void registrarToque(){
  setState(() {
    toques++;
    ultimoEvento = 'onTap : toque simples';
  });
}

void registrarToqueDuplo(){

  setState(() {
    toquesDuplos++;
    ultimoEvento = 'onDoubleTap : toques duplo';
  });
}

void registrarToqueLongo(){
  setState(() {
    toquesLongos++;
    ultimoEvento = 'onLongPress : toque mantido';
  });
}

void botaoResetar(){
setState(() {
  toques = 0;
  toquesLongos = 0;
  toquesDuplos = 0;
  ultimoEvento = '';
});
  
}
   @override

Widget build(BuildContext context){

//build descreve a interface exibida pelo flutter
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Evento e interações'),
    ),

    //   SingleChildScrollView permite rolar se o teclado ocupar toda parte da tela
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16), // cria apenas  16 unidades de espaço em todos os lados

        //column organiza od widget em colunas na vertical
        //stretch amblia os filhos na laargura disponivel
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Text('laboratorio de interações',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
            ),

            const SizedBox(height: 20),

            //entrada de dados
            TextField(
              //InputDecoration define a aparencia do campo
              decoration: const InputDecoration(
                //identifica o campo para o usuario
                labelText: 'Digite uma mensagem',
                //sugere um exemplo preenchido
                hintText: 'EX: estou aprendendo flutter',
                //exibe uma borda ao redor do campo
                border: OutlineInputBorder()
              ),
              //Entrega da função ao flutter
              //a cada mudança. o TextFild fornece uma String
              onChanged: atualizarTexto,

              //solicitando ao teclado a ação visual 'Concluido'
              //isso não envia dados ao servidor
              textInputAction: TextInputAction.done,

              //ao finalizar a entrada de dados, Flutter envia o texto, atual como argumento para enviar mensagem
              onSubmitted: enviarMensagem,

              //esse callback não recebe parametro
              //usamos um função separada para cuidar do foco.
              onEditingComplete: finalizarEdicao,
            ),
            const SizedBox(height: 12),

            Text('Digitando: $textoDigitado'),

             const SizedBox(height: 20),

             GestureDetector(
              //cada propriedade recebe uma função callback
              onTap: registrarToque,
              onDoubleTap:registrarToqueDuplo,
              onLongPress: registrarToqueLongo,

              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:BorderRadius.circular(12) 
                ),

                child: const Text(
                  'Toque, toque duas vezes ou mantenha precionado',
                  textAlign: TextAlign.center,
                ),
              ),
             ),

             const SizedBox(height: 20),

             Text('Ultimo evento: $ultimoEvento'),

               const SizedBox(height: 8),

               Text('toque simples: $toques'),
               Text('toque duplos: $toquesDuplos'),
               Text('toque longos: $toquesLongos'),

                const SizedBox(height: 8),

                Text('mensagem enviada: $mensagemEnviada'),

                ElevatedButton(
                  onPressed: botaoResetar, 
                  child: const Text('clique aqui')
                  )
          ],
        ),
        ),
    )
  );
}
}