import 'package:flutter/material.dart';

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
          color: Colors.black.withAlpha(25),
          width: 280,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 36, 91, 189))),
            onPressed: () {},
            child: Text('Generar reporte'),
          ),
        ),
      ),
    );
  }
}
