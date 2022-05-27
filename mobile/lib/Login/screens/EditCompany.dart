import 'package:flutter/material.dart';

import '../../appBar/appBar.dart';
import '../../button/Button.dart';

class EditCompany extends StatefulWidget {
  EditCompany({Key? key}) : super(key: key);

  @override
  State<EditCompany> createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: ButtonDesp(),
      body: budy(context),
    );
  }
}

Widget budy(BuildContext context) {
  return ListView(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          palabra(),
          nombres(),
          email(),
          //  documento(),
          fecha(),
          genero(),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Center(
              child: Container(
                width: 100,
                height: 50,
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 129, 129, 129))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('cancelar')],
                      )),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 50,
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 36, 91, 189))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('Añadir')],
                      )),
                ),
              ),
            )
          ])
        ],
      ),
    ],
  );
}

Widget palabra() {
  return Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Text('Editar Empresa',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'rlight',
          )));
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
        labelText: 'Nombre',
      ),
    ),
  );
}

Widget email() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 30),
    padding: EdgeInsets.all(10),
    child: TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.send,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'correo',
        labelText: 'Correo',
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
