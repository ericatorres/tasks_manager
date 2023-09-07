import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

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
        title: const Text('Tarefas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task('Aprender Flutter', 'assets/images/dash.png', 3),
            Task('Andar de bicicleta', 'assets/images/bike.jpg', 2),
            Task('Meditar', 'assets/images/meditar.jpeg', 5),
            Task('Ler', 'assets/images/ler.jpg', 1),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.white,
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
