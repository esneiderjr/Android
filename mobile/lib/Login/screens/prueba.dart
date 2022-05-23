import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Prueba extends StatefulWidget {
  Prueba({Key? key}) : super(key: key);

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: const Text('hola')));
  }
}
