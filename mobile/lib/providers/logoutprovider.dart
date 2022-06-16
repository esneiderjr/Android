import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../api/AllApi.dart';
import '../models/medelosCompany.dart';
import '../models/modeloTelefonos.dart';

class LogoutProvider extends ChangeNotifier {
  List<Compani> companys = [];
  List<Telefono> telefono = [];
  bool isTelefono = false;

  late var bodyResponse;

  logout() async {
    print('********************');
    LocalStorage storage = LocalStorage('userLogged');
    String url = '/logout-employees';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    print(bodyResponse);
    // String message = "";
  }
}
