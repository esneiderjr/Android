import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 252, 255, 253),
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/clotthy.png'),
            fit: BoxFit.contain,
          )),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const ButtonBar(
            children: <Widget>[],
          );
        },
        child: Icon(Icons.menu_outlined),
      ),
      body: Column(children: [
        // este es el boton para generar reportes
        Divider(color: Colors.white.withOpacity(0.1)),
        Center(
            child: Container(
          height: 40,
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 36, 91, 189))),
            onPressed: () {
              // el AlertDialog pbaara poder elegir la fecha del reporte
              AlertDialog alert = AlertDialog(
                title: const Text(
                  'GENERAR REPORTE',
                  textAlign: TextAlign.center,
                ),
                content: Container(
                  height: 320,
                  width: 210,
                  child: Column(
                    children: [
                      const Text(
                        'Fecha inicial',
                        textAlign: TextAlign.justify,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: widget)
                        ],
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                  ),
                ],
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  });
            },
            child: const Text('Generar reporte'),
          ),
        )),
        Divider(color: Colors.white.withOpacity(0.1)),
        Container(
            width: 300,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Reportes',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            )),
        // imagen de fondo
        Center(
            child: Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/background_decoration.png'),
                  fit: BoxFit.contain,
                )))),
      ]),
    );
  }
}
