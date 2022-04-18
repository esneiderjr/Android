import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pqrsf extends StatefulWidget {
  const Pqrsf({Key? key}) : super(key: key);

  @override
  State<Pqrsf> createState() => _PqrsfState();
}

class _PqrsfState extends State<Pqrsf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 252, 255, 253),
      appBar: AppBar(
        leading: Container(
          width: 15,
          height: 25,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/clotthy.png'),
            fit: BoxFit.contain,
          )),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 36, 91, 189),
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
        Container(
            width: 300,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Pqrsf',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
            )),
        // DropdownButton(items: [
        //   DropdownMenuItem(
        //     child: Text('tipo de solicitud'),
        //   )
        // ], onChanged: (valor){setState(() {

        // });})
      ]),
    );
  }
}
