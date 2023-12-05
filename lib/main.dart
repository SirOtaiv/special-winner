import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculador de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pesoController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Peso",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            TextField(
              controller: alturaController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Altura",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      // Adicionando showDialog ao pressionar o botão de calcular
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Resultado do IMC'),
                            content: Text('O seu IMC é: ${calcularIMC(double.parse(pesoController.text), double.parse(alturaController.text))}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Fechar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.black,
                    label: const Text('Calcular', style: TextStyle(fontSize: 20, color: Colors.red)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}