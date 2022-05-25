import 'package:flutter/material.dart';

import '../../appBar/appBar.dart';
import '../../button/Button.dart';

class AddCompany extends StatefulWidget {
  AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: ButtonDesp(),
      body: budy(),
    );
  }
}

Widget budy() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      palabra(),
      imagen(),
      datos(),
      nombres(),
      apellidos(),
      //  documento(),
      fecha(),
      genero()
    ],
  );
}

Widget palabra() {
  return Flexible(
    child: Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        child: Text('Añadir Empresa',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'rlight',
            ))),
  );
}

Widget imagen() {
  return Flexible(
    child: Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Image.asset(
        'images/clotthy2.png',
        width: 120,
        height: 110,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(66, 20, 17, 17), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget datos() {
  return Flexible(
    child: Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Text('Datos basicos',
          style: TextStyle(
            fontSize: 20,
          )),
    ),
  );
}

Widget nombres() {
  return Flexible(
    child: Container(
      margin: EdgeInsets.only(top: 10, left: 25),
      padding: EdgeInsets.all(15),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.send,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Nombres',
        ),
      ),
    ),
  );
}

Widget apellidos() {
  return Flexible(
    child: Container(
      margin: EdgeInsets.only(top: 10, left: 30),
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.send,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'Apellido',
          labelText: 'Apellidos',
        ),
      ),
    ),
  );
}

//  Widget documento(){
//   var documentos=['CC','CE'];
//   String vista='CC';
//  return Row(
//     children: [
//      DropdownButton(
//     items: <String> ['CC','CE']
//     .map<DropdownMenuItem<String>>((String value){
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//       value:documentos,
//       icon:Icon(Icons.arrow_drop_down),
//       iconSize:15,
//       elevation: 16,
//       style: TextStyle(color: Colors.grey),
//       underline: Container(
//         height:3,
//       ),
//      onChanged: (String value){
//        setState((){
//         documentos = value;
//        }

//        )
//      });
//    ],
//  );
// }
Widget fecha() {
  return Container();
}

Widget genero() {
  return Container();
}
