import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/AllApi.dart';

class LoginProvider extends ChangeNotifier {
  late String token;
  late String avatar;
  late String name;
  late String lastName;
  late String userName;
  late String role;

  getCompany(context) async {
    final provider = Provider.of<LoginProvider>(context);
    String token = provider.token;
    String url = '/company';
    Map<String, String> parametros = {

    };

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    String message = "";

    ;
  }
}
