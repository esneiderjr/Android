import 'package:flutter/material.dart';
import 'package:mobile/appBar/appBar.dart';
import 'package:mobile/button/Button.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  return ListView(
    children: [
      Column(
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
      ),
    ],
  );
}

Widget palabra() {
  return Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Text('Mi perfil',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'rlight',
          )));
}

Widget imagen() {
  return Container(
    margin: EdgeInsets.only(top: 30, left: 30),
    child: Image.asset(
      'images/Perfil.png',
      width: 120,
      height: 110,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(66, 20, 17, 17), width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

Widget datos() {
  return Container(
    margin: EdgeInsets.only(top: 30, left: 30),
    child: Text('Datos basicos',
        style: TextStyle(
          fontSize: 20,
        )),
  );
}

Widget nombres() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 25),
    padding: EdgeInsets.all(15),
    child: TextField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.send,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nombre',
        labelText: 'Nombres',
      ),
    ),
  );
}

Widget apellidos() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 30),
    padding: EdgeInsets.all(10),
    child: TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.send,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Apellido',
        labelText: 'Apellidos',
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
