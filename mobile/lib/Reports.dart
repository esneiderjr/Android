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
      backgroundColor: Color.fromARGB(250, 252, 255, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Clotthy',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ButtonBar(
            children: <Widget>[],
          );
        },
        child: Icon(Icons.menu_outlined),
      ),
      body: Center(
        child: Container(
          // este es el boton para generar reportes
          color: Colors.black.withAlpha(25),
          width: 280,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 36, 91, 189))),
            onPressed: () {
              // el AlertDialog para poder elegir la fecha del reporte
              AlertDialog alert = AlertDialog(
                title: const Text(
                  'GENERAR REPORTE',
                  // style: GoogleFonts.sourceSansPro(),
                  textAlign: TextAlign.center,
                ),
                content: Container(
                  height: 320,
                  width: 210,
                  child: Column(
                    children: [Text('')],
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
            child: Text('Generar reporte'),
          ),
        ),
      ),
    );
  }
}
