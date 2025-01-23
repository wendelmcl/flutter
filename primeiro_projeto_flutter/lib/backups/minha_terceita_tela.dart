import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Icon(
                    Icons.add_task_rounded,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          title: Text(
            'Flutter: Primeiro Passos',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: Column(
                children: [
                  Tela(Colors.white, Colors.pinkAccent, Colors.blue, Icons.people),
                  Tela(Colors.red, Colors.purple, Colors.lightBlue, Icons.people),
                  Tela(Colors.pink, Colors.yellow, Colors.blue, Icons.people),
                  Tela(Colors.purple, Colors.white, Colors.green, Icons.people),
                  Tela(Colors.green, Colors.white, Colors.red, Icons.people),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tela extends StatelessWidget {
  final Color color_1, color_2, color_3;
  final IconData icone;

  const Tela(this.color_1, this.color_2, this.color_3, this.icone,{super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 100, height = 140;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(20), color: color_1,
                  ),
                ),
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(20), color: color_2,
                  ),
                  child: Icon(icone),
                ),
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(20), color: color_3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}