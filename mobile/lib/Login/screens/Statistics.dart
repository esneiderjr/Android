import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Statistics());
}

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CLOTTHY",
      theme:
          ThemeData(backgroundColor: const Color.fromARGB(250, 252, 255, 253)),
      home: Estadisticas(),
    );
  }
}

class Estadisticas extends StatefulWidget {
  Estadisticas({Key? key}) : super(key: key);

  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graficos'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            alignment: Alignment.center,
            child: Image.asset('assets/background_decoration.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    // padding:EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // color:Color.fromARGB(255, 2, 69, 185)
                  )),
            ],
          )
        ],
      ),
    );
  }
}
