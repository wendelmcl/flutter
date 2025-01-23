import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Tarefas',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task(
              'Aprender Flutter',
              'assets/imagens/Eu7m692XIAEvxxP.png',
              3,
            ),
            Task(
              'Andar de Bike',
              'assets/imagens/cycling-bike-trail-sport-161172.jpeg',
              2,
            ),
            Task(
              'Meditar',
              'assets/imagens/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
              5,
            ),
            Task(
              'Ler',
              'assets/imagens/636052464065850579-137719760_flyer-image-1.jpg',
              4,
            ),
            Task(
              'Jogar',
              'assets/imagens/kako-epifania-2022-2-c-pia.jpg',
              1,
            ),
            SizedBox(height: 80,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              opacidade = !opacidade;
            },
          );
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
