import 'package:flutter/widgets.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Andar de bicicleta', 'assets/images/bike.jpg', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Ler', 'assets/images/ler.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  double globalLevel = 0;
  int dificuldadeGlobal = 1;

  void alteraGlobalLevel(int nivel, int dificuldade) {
    int qtdTarefas = taskList.length;
    globalLevel =
        globalLevel + ((nivel + dificuldade) / (dificuldade * qtdTarefas));
    if (taskList.isNotEmpty && globalLevel > (dificuldadeGlobal * 10)) {
      dificuldadeGlobal = dificuldadeGlobal * 10;
    }
    print(dificuldadeGlobal);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
