import 'package:flutter/material.dart';

class CurriloScreen extends StatefulWidget {
  const CurriloScreen({super.key});

  @override
  State<CurriloScreen> createState() {
    return _CurriloScreenState();
  }

   
}

class _CurriloScreenState extends State<CurriloScreen> {


 Widget habilidade(String nome) {
  return Chip(
    label: Text(nome),
    backgroundColor: Colors.white,
    side: const BorderSide(
      color: Color(0xFFD0D7DE),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
       children: [
        Container(

          width: double.infinity,
          color: Color(0xFF173451),
          padding: const EdgeInsets.all(25),

         child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(' Meu Curriculo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,),
              
              ),
              const SizedBox(height: 8),
              const CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,

                  size: 80,
                  color: Color(0xFF173451),
                ) ,
              ),
              const SizedBox(height: 10),
              const Text('Luis Felipe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
                ),
                ) ,
                const SizedBox(height: 10),

                  const Text('Desenvolvedor Flutter',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  ),
                  const SizedBox(height: 10),

                  const Text('São Paulo -SP',
                  style: TextStyle(
                    fontSize: 13,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                  ),
                  ),
                  const SizedBox(height: 10),

                  const Text('luisFortin@gmail.com',
                  style: TextStyle(
                    fontSize: 13,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                  ),
                  ),
                  const SizedBox(height: 10),

                  const Text('(11)55588-0000',
                  style: TextStyle(
                    fontSize: 13,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                  ),
                  ),
          ],
         ),
        ),

    // SEGUNDO CONTAINER
    // SEGUNDO CONTAINER
Transform.translate(
  offset: const Offset(0, -0),

  child: Container(
    width: double.infinity,

    decoration: const BoxDecoration(
      color: Color(0xFFF0F3F7),

      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),

    padding: const EdgeInsets.all(20),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // SOBRE MIM
        Row(
          children: [
            const Icon(
              Icons.person_outline,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(width: 10),

            const Text(
              'Sobre mim',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173451),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        const Text(
          'Sou desenvolvedor apaixonado por tecnologia e desenvolvimento de aplicativos. Busco criar soluções modernas e funcionais.',
        ),

        const SizedBox(height: 25),

        // EXPERIÊNCIA PROFISSIONAL
        Row(
          children: [
            const Icon(
              Icons.work_outline,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                'Experiência Profissional',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173451),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        const Text(
          'Desenvolvedor Mobile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        const Text(
          'Tech Solutions | 2023 - Atual',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Desenvolvimento de interfaces e aplicativos utilizando Flutter e linguagem Dart.',
        ),

        const SizedBox(height: 25),

         Row(
          children: [
            const Icon(
              Icons.school_outlined,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                'Formação Acadêmica',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173451),
                ),
              ),
            ),
          ],
        ),

         const SizedBox(height: 8),

            const Text(
          'Análise e Desenvolvimento de Sistemas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
             const Text(
          'Faculdade de Tecnologia | 2022 - 2024',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

         const SizedBox(height: 25),

         Row(
          children: [
            const Icon(
           Icons.code,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                'Habilidades',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173451),
                ),
              ),
            ),
          ],
        ),

        Wrap(
  spacing: 8,
  runSpacing: 12,

  children: [
    habilidade('Flutter'),
    habilidade('Dart'),
    habilidade('Python'),
    habilidade('HTML'),
    habilidade('CSS'),
    habilidade('Git'),
  ],
),
   

        const SizedBox(height: 25),


         Row(
          children: [
            const Icon(
           Icons.language,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                'Idiomas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173451),
                ),
              ),
            ),
          ],
        ),
         const SizedBox(height: 10),

              const Text(
          'Português - Nativo',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

        const Text(
          'Inglês - intermediario',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

       

      ],
    ),
  ),
),
       ],

        ),
      ),
    );
  }
}