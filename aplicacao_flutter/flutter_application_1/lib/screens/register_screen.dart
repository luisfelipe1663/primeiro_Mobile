import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

// Essa class guarda o estado da tela
class _RegisterScreenState extends State<RegisterScreen> {
  // GlobalKey cria uma chave que permite acessar um wdiget e o seu estado
  // < FormState informa que essa chave será usada especificamente para acessar o estado de um  form
  // Final significa que _formKey recebera esta chave unica vez e não sera substituida por outra
  final _formkey = GlobalKey<FormState>();

  // variavel para armazenar a senha digitada
  String _senha = '';
  bool _ocultarSenha = true; // Informa que a senha começa oculta
  bool _ocultarConfirmacao =
      true; // controla separadamente a confirmação de senha
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),

      body: SingleChildScrollView(
        child: Padding(
          // Espaçamento interno em todo os lados de 16px
          padding: const EdgeInsets.all(16),

          // Form agrupo os campos que serão validados
          child: Form(
            key: _formkey,
            child: Column(
              // Em colunm o eixo transversal é horizontal
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Crie sua conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Divider(),

                const Text('Preencha os campos abaixo para o continuar.'),

                SizedBox(height: 24),

                TextFormField(
                  // decoration recebe o InputDecoration responsavel pela aparença do campo
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // Validator recebe uma função, e value representa o texto atual do campo
                  validator: (value) {
                    // Validação de campos null vazios
                    if (value == null || value.trim().isEmpty) {
                      return 'Infome seu nome';
                    }
                    // validação de quantidade de caracteres
                    if (value.trim().length < 3) {
                      return 'Digitar pelo menos 3 caracteres';
                    }

                    // null significa que nhenum erro foi encontrado
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome@exemplo.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),

                  // surgere um teclado adeguado para email
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu email';
                    }

                    // constais(@) verifica se existe o @.
                    if (!value.contains('@')) {
                      return 'Digite um email valido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarSenha,

                  onChanged: (value) {
                    _senha = value;
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe sua senha';
                    }

                    // constais(@) verifica se existe o @.
                    if (value.length < 6) {
                      return 'Digite no minimo 6 digitos';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 24),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirma sua senha',
                    hintText: 'Digite sua senha novamente',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarConfirmacao ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _ocultarConfirmacao = !_ocultarConfirmacao;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarConfirmacao,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'confirme sua senha';
                    }

                    // constais(@) verifica se existe o @.
                    if (value !=_senha){
                      return 'As senha devem ser iguais';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final formularioValidado =
                          _formkey.currentState?.validate() ?? false;

                      if (formularioValidado) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro realizado com sucesso'),
                          ),
                        );
                      }
                    },
                    child: const Text('cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
