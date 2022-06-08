import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Login/screens/AddCompany.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/appBar/appBar.dart';
import 'package:mobile/providers/companyProvider.dart';
import 'package:provider/provider.dart';
import '../../button/Button.dart';
import 'EditCompany.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

String name = 'example';
String email = 'example@gmail.com';
var number = '32116556515';
var nit = '12345678589-1';
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
    final provider = Provider.of<CompanyProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: const Color.fromARGB(250, 252, 255, 253),
        floatingActionButton: ButtonDesp(),
        body: ListView(
          children: [
            Column(
              children: [
                // este es el titulo de la seccion
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
                      // boton de añadir una empresa
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 36, 91, 189))),
                          onPressed: () {
                            print("pepe");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AddCompany()))
                            provider.getCompany(context);
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 350,

                        // cards con los datos de una empresa
                        child: Card(
                            shadowColor: Color.fromARGB(255, 36, 91, 189),
                            elevation: 25,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            // margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(name),
                                      Text(email),
                                      Text(number),
                                      const Divider(
                                        indent: 2.5,
                                      ),
                                      // iconos botones para redireccionar la card
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  title: Text(name),
                                                  content: Container(
                                                    width: 250,
                                                    height: 280,
                                                    child: ListView(
                                                      children: [
                                                        ListTile(
                                                          title: Text('Emai'),
                                                          subtitle: Text(email),
                                                          trailing: const Icon(
                                                            FontAwesomeIcons
                                                                .paperPlane,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    36,
                                                                    91,
                                                                    189),
                                                          ),
                                                        ),
                                                        ListTile(
                                                            title: Text(
                                                                'Telefono'),
                                                            subtitle:
                                                                Text(number),
                                                            trailing:
                                                                const Icon(
                                                              FontAwesomeIcons
                                                                  .phone,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      36,
                                                                      91,
                                                                      189),
                                                            )),
                                                        ListTile(
                                                          title: Text('Nit'),
                                                          subtitle: Text(nit),
                                                          trailing: const Icon(
                                                            FontAwesomeIcons
                                                                .hashtag,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    36,
                                                                    91,
                                                                    189),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Color.fromARGB(
                                                                            255,
                                                                            36,
                                                                            91,
                                                                            189))),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'ok'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              icon: const Icon(
                                                FontAwesomeIcons.list,
                                                color: Color.fromARGB(
                                                    255, 36, 91, 189),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  showDialog<String>(
                                                      context: context,
                                                      builder:
                                                          (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                title: Text(
                                                                    'Redes sociales'),
                                                                content:
                                                                    Container(
                                                                  height: 250,
                                                                  child:
                                                                      ListView(
                                                                    children: [
                                                                      const ListTile(
                                                                        title: Text(
                                                                            'facebook'),
                                                                        leading: Icon(
                                                                            FontAwesomeIcons
                                                                                .facebook,
                                                                            color:
                                                                                Colors.blue),
                                                                      ),
                                                                      const ListTile(
                                                                        title: Text(
                                                                            'Instagram'),
                                                                        leading:
                                                                            Icon(
                                                                          FontAwesomeIcons
                                                                              .instagram,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                      ),
                                                                      ListTile(
                                                                        title: const Text(
                                                                            'Whatsapp'),
                                                                        subtitle:
                                                                            Text(number),
                                                                        leading:
                                                                            const Icon(
                                                                          FontAwesomeIcons
                                                                              .whatsapp,
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),
                                                                      ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 36, 91,
                                                                                  189))),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text('ok'))
                                                                    ],
                                                                  ),
                                                                ),
                                                              )),
                                              icon: Icon(
                                                FontAwesomeIcons.plus,
                                                color: Color.fromARGB(
                                                    255, 36, 91, 189),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () => {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditCompany()))
                                                    },
                                                icon: Icon(
                                                  FontAwesomeIcons.penToSquare,
                                                  color: Color.fromARGB(
                                                      255, 36, 91, 189),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ]))),
                      )
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
