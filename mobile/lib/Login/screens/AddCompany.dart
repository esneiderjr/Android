import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/appBar/appBar.dart';
import 'package:mobile/button/Button.dart';
import 'package:mobile/providers/companyProvider.dart';
import 'package:provider/provider.dart';

class AddCompany extends StatefulWidget {
  AddCompany({Key? key}) : super(key: key);
  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyProvider>(context);
    

    var result;
    TextEditingController nameComController = TextEditingController();
    TextEditingController nitComController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController instagramComController = TextEditingController();
    TextEditingController facebookComController = TextEditingController();


    String company_name = "";
    String nit = "";
    String sm_url_1 = "";
    String sm_url_2 = "";
    String cp_1 = "";

    Map<String, dynamic> parametros = {
      'company_name': company_name,
      'nit': nit,
      'sm_2': '2',
      'sm_url_1': sm_url_1,
      'sm_url_2': sm_url_2,
      'cp_length': '1',
      'cp_1': cp_1,
      'indicative_cp_1': '+57',
      'image': result
    };
    return Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: ButtonDesp(),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // titulo
                Container(
                    margin: const EdgeInsets.only(top: 30, left: 30),
                    child: const Text('Editar compañia',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'rlight',
                        ))),
                // imagen
                Container(
                    margin: const EdgeInsets.only(top: 30, left: 30),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255))),
                      onPressed: () {
                        result = FilePicker.platform.pickFiles();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(FontAwesomeIcons.clipboard),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(66, 20, 17, 17),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),

                // sub titulo (datos basico)
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 30),
                  child: const Text('Datos basicos',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                // nombre
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: nameComController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.send,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      hintText: 'Razon Social',
                      labelText: 'Razon Socail',
                    ),
                  ),
                ),

                // documento
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('NIT: '),
                    Container(
                        width: 250,
                        child: TextFormField(
                          controller: nitComController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.send,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: 'Numero de doc',
                            labelText: 'Numero de doc',
                          ),
                        ))
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.send,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      icon: Icon(FontAwesomeIcons.phone),
                      hintText: 'Celular',
                      labelText: 'Celular',
                    ),
                  ),
                ),
                Divider(),

                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: instagramComController,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.send,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
                      ),
                      hintText: 'Celular',
                      labelText: 'Celular',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: facebookComController,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.send,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      hintText: 'Celular',
                      labelText: 'Celular',
                    ),
                  ),
                ),
                Divider(),
                // boton actualizar
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          width: 125,
                          height: 50,
                          child: Center(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 36, 91, 189))),
                                onPressed: () {
                                  setState(() {
                                    company_name = nameComController.text;
                                    nit = nitComController.text;
                                    sm_url_1 = instagramComController.text;
                                    sm_url_2 = facebookComController.text;
                                    cp_1 = phoneController.text;
                                  });
                                  provider.updateCompany(parametros, context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [Text('Actualizar')],
                                )),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ));
  }
}
