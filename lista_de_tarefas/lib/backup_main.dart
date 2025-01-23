import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Tasks(),
    );
  }
}

class Tasks extends StatefulWidget {
  Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final tarefas = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  TextEditingController nome_da_tarefa = TextEditingController();

  void addItem() {
    tarefas.insert(0, "Tarefa: ${nome_da_tarefa.text}");
    _key.currentState!.insertItem(
      0,
      duration: Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
          (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: Duration(
        milliseconds: 300,
      ),
    );
    tarefas.removeAt(index);
  }

  void clearText() {
    nome_da_tarefa.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Icon(
            Icons.add_task_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 260,
              child: TextField(
                autofocus: true,
                controller: nome_da_tarefa,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.task),
                  hintText: 'Digite o nome da tarefa: ',
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                onPressed: () {
                  setState(
                        () {
                      addItem();
                      clearText();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            )
                          ],
                          title: Text('Tarefa'),
                          content: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text('Tarefa cadastrada com sucesso'),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _key,
                initialItemCount: 0,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    key: UniqueKey(),
                    sizeFactor: animation,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.greenAccent,
                      child: ListTile(
                        title: Text(
                          tarefas[index],
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removeItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}