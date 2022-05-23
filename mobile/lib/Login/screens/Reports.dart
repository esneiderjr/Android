import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/appBar/appBar.dart';
import '../../button/Button.dart';


class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  var dateI;
  var dateF;
  var _currentselectedDate;
  void callDatePicker() async {
    var selectDate = await getDatePickerwidget();
    setState(() {
      _currentselectedDate = selectDate;
    });
  }

  Future<DateTime?> getDatePickerwidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2023),
        builder: (context, child) {
          return Theme(data: ThemeData.light(), child: child!);
        });
  }

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
                // este es el boton para generar reportes
                Divider(color: Colors.white.withOpacity(0.1)),
                Center(
                    child: Container(
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 36, 91, 189))),
                    onPressed: () {
                      // el AlertDialog pbaara poder elegir la fecha del reporte
                      AlertDialog alert = AlertDialog(
                        title: const Text(
                          'GENERAR REPORTE',
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          height: 190,
                          width: 150,
                          child: Column(
                            children: [
                              TextField(
                                onTap: (() {
                                  callDatePicker();
                                  setState(() {
                                    dateI = _currentselectedDate;
                                  });
                                  print(dateI);
                                }),
                                decoration: InputDecoration(),
                              ),
                              const Divider(color: Colors.white),
                              const Text(
                                'Fecha final',
                                textAlign: TextAlign.left,
                              ),
                              TextField(
                                onTap: () {
                                  callDatePicker();
                                  setState(() {
                                    dateF = _currentselectedDate;
                                  });
                                  print(dateF);
                                },
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 126, 128, 131))),
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.pop(context, 'cancelar');
                            },
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 36, 91, 189))),
                            child: const Text('Aceptar'),
                            onPressed: () {
                              Navigator.pop(context, 'ok');
                            },
                          ),
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    },
                    child: const Text('Generar reporte'),
                  ),
                )),
                Divider(color: Colors.white.withOpacity(0.1)),
                Container(
                    width: 300,
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Reportes',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                    )),
                // imagen de fondo
              ],
            ),
            Flexible(
                child: Container(
                    // width: 400,
                    // height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
              image: AssetImage('images/background_decoration.png'),
              fit: BoxFit.contain,
            ))))
          ],
        ),
      ),
    );
  }
}
