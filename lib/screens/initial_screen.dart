import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text('Tarefas'),
            ),
            Container(
              height: 35,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: SizedBox(
                        width: 150,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: TaskInherited.of(context).globalLevel /
                              (10 *
                                  TaskInherited.of(context).dificuldadeGlobal),
                        )),
                  ),
                  Text(
                    'Nível ${TaskInherited.of(context).globalLevel.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FormScreen(taskContext: context),
            ),
          );
        },
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
