import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: ConversorDeMoedas(),
    );
  }
}

class ConversorDeMoedas extends StatelessWidget {
  ConversorDeMoedas({super.key});

  TextEditingController valor = TextEditingController();
  double dolar = 0.0, euro = 0.0;

  double converter_dolar() {
    dolar = double.parse(valor.text) * 6.18;
    return dolar;
  }

  double converter_euro() {
    euro = double.parse(valor.text) * 6.38;
    return euro;
  }

  void clearText() {
    valor.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Conversor de Moeda',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        leading: Icon(Icons.attach_money, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  child: TextField(
                    textAlign: TextAlign.justify,
                    autofocus: true,
                    controller: valor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      icon: Icon(Icons.attach_money),
                      hintText: 'Digite o valor: ',
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+(\.\d*)?')),
                    ],
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    if (valor.text.isNotEmpty) {
                      converter_euro();
                      converter_dolar();
                      clearText();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK', style: TextStyle(fontSize: 18),),
                              ),
                            ],
                            title: Text('Conversor de Moeda:', style: TextStyle(fontSize: 20),),
                            content: Text('Dólar: ${dolar.toStringAsFixed(2)} USD\nEuro: ${euro.toStringAsFixed(2)} EUR', style: TextStyle(fontSize: 16),),
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
