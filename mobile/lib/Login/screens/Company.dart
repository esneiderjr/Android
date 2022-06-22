import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/appBar/appBar.dart';
import 'package:mobile/models/medelosCompany.dart';
import 'package:mobile/providers/companyProvider.dart';
import 'package:provider/provider.dart';
import '../../button/Button.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  void initState() {
    Provider.of<CompanyProvider>(context, listen: false).getCompanys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final companys = Provider.of<CompanyProvider>(context).companys;
    final provider = Provider.of<CompanyProvider>(context);

    List<Widget> itemMap =
        companys.map((e) => card(e, provider, context)).toList();

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
                            // print("pepe");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AddCompany()))
                            // provider.getCompany(context);
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
              ],
            ),
            ...itemMap
          ],
        ),
      ),
    );
  }

  Card card(Compani e, CompanyProvider provider, BuildContext context) {
    Provider.of<CompanyProvider>(context, listen: false).getCompanyNet(e.id!);
    Provider.of<CompanyProvider>(context, listen: false).getCompanytel(e.id!);
    return Card(
        shadowColor: Color.fromARGB(255, 36, 91, 189),
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
        child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Text(e.nombreempresa!),
              (provider.isTelefono)
                  ? (provider.telefono[0].numerotelefono != null)
                      ? Text(provider.telefono[0].numerotelefono!)
                      : const Text('Sin Datos')
                  : const Text('Sin Datos'),
              Text(e.nitempresa!),
              const Divider(
                indent: 3.5,
              ),
              // iconos botones para redireccionar la card
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          infoEmpresa(e, provider);
                        });
                      },
                      icon: const Icon(
                        FontAwesomeIcons.list,
                        color: Color.fromARGB(255, 36, 91, 189),
                      ),
                    ),
                    IconButton(
                      onPressed: () => socialNet(context, e, provider),
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        color: Color.fromARGB(255, 36, 91, 189),
                      ),
                    ),
                    IconButton(
                        onPressed: () => {provider.getCompany(context, e.id)},
                        icon: Icon(
                          FontAwesomeIcons.penToSquare,
                          color: Color.fromARGB(255, 36, 91, 189),
                        )),
                  ],
                ),
              ),
            ])));
  }

  Future<String?> socialNet(
      BuildContext context, Compani e, CompanyProvider provider) {
    Provider.of<CompanyProvider>(context, listen: false).getCompanyNet(e.id!);
    Provider.of<CompanyProvider>(context, listen: false).getCompanytel(e.id!);

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Redes sociales'),
              content: Container(
                height: 250,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('facebook'),
                      subtitle: (provider.isRed)
                          ? (provider.socialNetworks[1].nombrered ==
                                  "Instagram")
                              ? Text(
                                  provider.socialNetworks[0].enlacered!,
                                  style: TextStyle(fontSize: 13),
                                )
                              : Text('Sin Datos')
                          : Text('sin datos'),
                      leading:
                          Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                    ),
                    ListTile(
                      title: Text('Instagrim'),
                      subtitle: (provider.isRed)
                          ? (provider.socialNetworks[1].nombrered ==
                                  "Instagram")
                              ? Text(
                                  provider.socialNetworks[1].enlacered!,
                                  style: TextStyle(fontSize: 13),
                                )
                              : Text('Sin Datos')
                          : Text('sin datos'),
                      leading: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text('Whatsapp'),
                      subtitle: (provider.isTelefono)
                          ? (provider.telefono.length != 0)
                              ? Text(provider.telefono[0].numerotelefono!)
                              : const Text('Sin Datos')
                          : const Text('Sin Datos'),
                      leading: const Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 36, 91, 189))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('ok'))
                  ],
                ),
              ),
            ));
  }

  infoEmpresa(Compani e, CompanyProvider provider) {
    Provider.of<CompanyProvider>(context, listen: false).getCompanytel(e.id!);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(e.nombreempresa!),
        content: Container(
          width: 250,
          height: 280,
          child: ListView(
            children: [
              ListTile(
                title: Text('Fecha creacion'),
                subtitle: Text(e.fechacreacion!),
                trailing: const Icon(
                  FontAwesomeIcons.paperPlane,
                  color: Color.fromARGB(255, 36, 91, 189),
                ),
              ),
              ListTile(
                  title: Text('Telefono'),
                  subtitle: (provider.isTelefono)
                      ? (provider.telefono.length != 0)
                          ? Text(provider.telefono[0].numerotelefono!)
                          : const Text('Sin Datos')
                      : const Text('Sin Datos'),
                  trailing: const Icon(
                    FontAwesomeIcons.phone,
                    color: Color.fromARGB(255, 36, 91, 189),
                  )),
              ListTile(
                title: Text('Nit'),
                subtitle: Text(e.nitempresa!),
                trailing: const Icon(
                  FontAwesomeIcons.hashtag,
                  color: Color.fromARGB(255, 36, 91, 189),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 36, 91, 189))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok'))
            ],
          ),
        ),
      ),
    );
  }
}
