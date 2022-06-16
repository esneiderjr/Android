import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import '../api/AllApi.dart';
import '../models/medelosCompany.dart';
import '../models/modeloTelefonos.dart';
import 'loginProvider.dart';

class CompanyProvider extends ChangeNotifier {
  List<Compani> companys = [];
  List<Telefono> telefono = [];
  bool isTelefono = false;

  late var bodyResponse;

  getCompanys() async {
    print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    final Companys datos = Companys.fromlist(bodyResponse['data']['data']);
    companys = datos.dato;
    // print(bodyResponse);

    notifyListeners();
    // String message = "";
  }

  getCompany(String id) async {
    // print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/company/$id';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);

    // print(bodyResponse);
    final Telefonos telefono =
        Telefonos.fromlist(bodyResponse['data']['telefonos']);
    this.telefono = telefono.dato;
    if (telefono.dato[0].id != "") {
      isTelefono = true;
    }

    notifyListeners();
    // String message = "";
  }
}
