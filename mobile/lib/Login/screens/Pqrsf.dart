import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Login/screens/home_screen.dart';
import 'package:mobile/Login/screens/profile.dart';
import 'package:mobile/button/Button.dart';

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
      floatingActionButton: ButtonDesp(),
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
                decoration: const InputDecoration(
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
            child: const Text('Adjuntar captura')),

        Divider(color: Colors.white.withOpacity(0.1)),
        Divider(color: Colors.white.withOpacity(0.1)),

        Container(alignment: Alignment.topLeft, child: const Text('Asunto')),
        const Divider(),

        const Flexible(
            child: SizedBox(
          height: 250,
          width: 300,
          child: TextField(
            maxLines: 50,
            decoration: InputDecoration(
              hintText: "Descripcion",
            ),
          ),
        )),
        Divider(color: Colors.white.withOpacity(0.1)),

        Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 126, 128, 131))),
              child: const Text('enviar'),
              onPressed: () {
                Navigator.pop(context, 'cancelar');
              },
            ))
        // ElevatedButton(onPressed: (){}, child:
        // )
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
