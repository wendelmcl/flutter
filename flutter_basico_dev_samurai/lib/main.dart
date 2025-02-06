import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        contatos: [
          'Francisco',
          'Wendel',
          'de',
          'Lima',
          'Maciel',
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.contatos});

  List<String> contatos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.contact_phone,
          color: Colors.white,
        ),
        title: Text(
          'Lista de Contatos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.person),
          title: Text(
            contatos[index],
          ),
          trailing: Container(
            width: 60,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 6,),
                Icon(Icons.delete),
              ],
            ),
          ),
        ),
        itemCount: contatos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
