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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Text(
                'Flutter: Primeiros Passos',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          leading: Icon(Icons.add_task_rounded, color: Colors.white,),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Color(0x303aaecc),
              child: Column(
                children: [
                  Widget_Contra_Ataca(
                      Colors.white, Colors.pink, Colors.lightBlueAccent),
                  Widget_Contra_Ataca(Colors.redAccent, Colors.purple, Colors.blue),
                  Widget_Contra_Ataca(
                      Colors.pinkAccent, Colors.yellow, Colors.lightBlue),
                  Widget_Contra_Ataca(
                      Colors.purpleAccent, Colors.white, Colors.green),
                  Widget_Contra_Ataca(
                      Colors.green, Colors.white, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Widget_Contra_Ataca extends StatelessWidget {
  final Color color_1, color_2, color_3;

  const Widget_Contra_Ataca(this.color_1, this.color_2, this.color_3,
      {super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 100, height = 135;
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
                  color: color_1,
                ),
                Container(
                  width: width,
                  height: height,
                  color: color_2,
                ),
                Container(
                  width: width,
                  height: height,
                  color: color_3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}