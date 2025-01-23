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
      home: Calculadora_Simples(),
    );
  }
}

class Calculadora_Simples extends StatefulWidget {
  Calculadora_Simples({super.key});

  @override
  State<Calculadora_Simples> createState() => _Calculadora_SimplesState();
}

TextEditingController valor_1 = TextEditingController();
TextEditingController valor_2 = TextEditingController();
double soma = 0.0, subtracao = 0.0, multiplicacao = 0.0, divisao = 0.0;

double somar() {
  soma = double.parse(valor_1.text) + double.parse(valor_2.text);
  return soma;
}

double subtrair() {
  subtracao = double.parse(valor_1.text) - double.parse(valor_2.text);
  return subtracao;
}

double multiplicar() {
  multiplicacao = double.parse(valor_1.text) * double.parse(valor_2.text);
  return multiplicacao;
}

double dividir() {
  divisao = double.parse(valor_1.text) / double.parse(valor_2.text);
  return divisao;
}

class _Calculadora_SimplesState extends State<Calculadora_Simples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          child: Icon(
            Icons.calculate,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Calculadora Simples',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.black),
          ),
          child: Stack(
            children: [
              Container(
                height: 40,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: valor_1,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Digite um valor: ',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: valor_2,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Digite um valor: ',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        setState(
                          () {
                            somar();
                            subtrair();
                            multiplicar();
                            dividir();
                            valor_1.clear();
                            valor_2.clear();
                          },
                        );
                      },
                      child: Icon(Icons.equalizer, color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Soma: ${soma.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          'Subtração: ${subtracao.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          'Multiplicação: ${multiplicacao.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          'Divisão: ${divisao.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
