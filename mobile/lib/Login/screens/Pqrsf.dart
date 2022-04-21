import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
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
            image: AssetImage('images/clotthy2.png'),
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
        Divider(color: Colors.white.withOpacity(0.1)),
        // este container contiene el titulo
        Container(
            width: 300,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Pqrsf',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
            )),
        Divider(color: Colors.white.withOpacity(0.1)),
        Divider(color: Colors.white.withOpacity(0.1)),
        Container(
            color: Colors.white,
            height: 30,
            width: 320,
            child: TextFormField(
                decoration: InputDecoration(
                    hintText: "aqui va el tipo de solicitud",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )))),
        Divider(color: Colors.white.withOpacity(0.1)),

        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 39, 104, 136))),
            onPressed: () {
              final result = FilePicker.platform.pickFiles();
            },
            child: Text('Adjuntar captura')),

        Divider(color: Colors.white.withOpacity(0.1)),
        Divider(color: Colors.white.withOpacity(0.1)),

        Container(alignment: Alignment.topLeft, child: Text('Asunto')),
        Divider(),

        Container(
          color: Colors.white,
          height: 300,
          width: 300,
          child: TextFormField(
            cursorHeight: 15,
            autocorrect: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 134, 136, 134),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 47, 255),
                  width: 1,
                ),
              ),
              hintText: "Descripcion",
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        // DropdownButton(
        //   items: [
        //     DropdownMenuItem(
        //       child: Text('tipo de solicitud'),
        //     )
        // ],
        // onChanged: (valor){
        //     setState(() {
        //   });
        // })
      ]),
    );
  }
}
