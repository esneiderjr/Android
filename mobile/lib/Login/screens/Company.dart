import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Login/screens/AddCompany.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/appBar/appBar.dart';
import '../../button/Button.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

// List empresa =[
//     1,
//     'example',
//     'example@gmail.com',
//     '3213513135'
// ];

// void empresas() {
//   for (var i in empresa) {
//     print('posicion $i');


//   }
// }

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: const Color.fromARGB(250, 252, 255, 253),
        floatingActionButton: ButtonDesp(),
        body: ListView(
          children: [
            Column(
              children: [
                Title(
                    color: Colors.black,
                    child: const Text('Empresas',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.normal))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 36, 91, 189))),
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddCompany()))
                              },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('Agregar'),
                                Icon(FontAwesomeIcons.squarePlus)
                              ])),
                    ),
                  ),
                ),
                Row(children: [
                  Card(
                      elevation: 150,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      // margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('  example  '),
                                Text(' example@gmail.com '),
                                Text('311525434'),
                                Container(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.penToSquare,
                                        color: Color.fromARGB(255, 36, 91, 189),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.plus,
                                        color: Color.fromARGB(255, 36, 91, 189),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.list,
                                        color: Color.fromARGB(255, 36, 91, 189),
                                      )
                                    ],
                                  ),
                                ),
                              ])))
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
