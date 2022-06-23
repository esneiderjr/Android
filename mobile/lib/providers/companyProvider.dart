import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/models/modeloOneComany.dart';
import '../api/AllApi.dart';
import '../models/medelosCompany.dart';
import '../models/modeloNetworks.dart';
import '../models/modeloTelefonos.dart';
import 'loginProvider.dart';

class CompanyProvider extends ChangeNotifier {
  List<Compani> companys = [];
  List<Telefono> telefono = [];
  List<SocialNetwork> socialNetworks = [];
  List<dynamic> oneCompany = [];

  // se utiliza para un solo llamado de una empresa
  int? id;
  int? idciudad;
  String? nombreempresa;
  String? logo;
  String? nitempresa;
  String? fechacreacion;
  String? fechamodificacion;

  bool isTelefono = false;
  bool isRed = false;
  bool isCompany = false;

  late var bodyResponse;

  getCompanys() async {
    // print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    print(bodyResponse['data'].runtimeType);

    final Companys datos = Companys.fromlist(bodyResponse['data']['data']);
    companys = datos.dato;
    // print(bodyResponse);

    notifyListeners();
    // String message = "";
  }

  getCompanytel(String id) async {
    // print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company/$id';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);

    // print(bodyResponse);
    try {
      final Telefonos telefono =
          Telefonos.fromlist(bodyResponse['data']['telefonos']);
      this.telefono = telefono.dato;
      if (telefono.dato[0].id != "") {
        isTelefono = true;
      }

      notifyListeners();
    } finally {
      print(''); // String message = "";
    }
  }

  getCompanyNet(String id) async {
    // print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company/$id';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);

    // print('**************  ' + bodyResponse.toString());
    try {
      final SocialNetworks socialNetworks =
          SocialNetworks.fromlist(bodyResponse['data']['redessociales']);

      this.socialNetworks = socialNetworks.dato;
      print(socialNetworks.dato);
      if (socialNetworks.dato != "") {
        isRed = true;
      }
    } finally {
      print('error en redes');
    }
    // // print(socialNetworks.dato);
    // notifyListeners();
    // // String message = "";
  }

  getCompany(context, id) async {
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company/$id';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    print('**************  ' + bodyResponse['data'].toString());
    print(bodyResponse['data'].runtimeType);

    Navigator.pushNamed(context, "EditCompany");

    this.id = bodyResponse['data']['id'];
    this.idciudad = bodyResponse['data']['idciudad'];
    this.nombreempresa = bodyResponse['data']['nombreempresa'].toString();
    this.logo = bodyResponse['data']['logo'].toString();
    this.nitempresa = bodyResponse['data']['nitempresa'].toString();
    this.fechacreacion = bodyResponse['data']['fechacreacion'].toString();
    this.fechamodificacion =
        bodyResponse['data']['fechamodificacion'].toString();

    notifyListeners();
  }

  updateCompany(parametros, context) async {
    final LocalStorage storage = LocalStorage('userLogged');
    String url = '/company/{id}';
    // conexion a all api contando los documentos
    final resp = await AllApi.httpPost(url, parametros);
    final bodyResponse = jsonDecode(resp.body);
    String message = "";

    if (resp.statusCode == 200) {
      print('ok');
      Navigator.pushReplacementNamed(context, "Company");
    } else if (resp.statusCode == 400) {
      // castea los mensajes de errores y los pone en un show dialog
      if (bodyResponse['message'] is List<dynamic>) {
        for (var m in bodyResponse['message']) {
          message += m + "\n";
        }
      } else {
        message = bodyResponse['message'];
      }
      AlertDialog alert = AlertDialog(
        // backgroundColor: Colors.white.withOpacity(0.7),
        title: const Text('error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          ),
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }

  newCompany(parametros, context) async {
    final LocalStorage storage = LocalStorage('userLogged');
    String url = '/company';
    // conexion a all api contando los documentos
    final resp = await AllApi.httpPost(url, parametros);
    final bodyResponse = jsonDecode(resp.body);
    String message = "";

    if (resp.statusCode == 200) {
      print('ok');
    } else if (resp.statusCode == 400) {
      // castea los mensajes de errores y los pone en un show dialog
      if (bodyResponse['message'] is List<dynamic>) {
        for (var m in bodyResponse['message']) {
          message += m + "\n";
        }
      } else {
        message = bodyResponse['message'];
      }
      AlertDialog alert = AlertDialog(
        // backgroundColor: Colors.white.withOpacity(0.7),
        title: const Text('error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          ),
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }
}
