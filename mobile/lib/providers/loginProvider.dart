import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile/Login/screens/Company.dart';
import '../api/AllApi.dart';

class LoginProvider extends ChangeNotifier {
  getUsuario(String email, String password, context) async {
    String url = '/signin/employees';

    Map<String, String> parametros = {
      'email': email,
      'password': password,
      'password_confirmation': password
    };

    final resp = await AllApi.httpPost(url, parametros);
    final bodyResponse = jsonDecode(resp.body);
    final token = bodyResponse['token'];
    // print(resp.statusCode.runtimeType);
    if (resp.statusCode == 200) {
      print(true);
      Navigator.pushReplacementNamed(context, "Company");
    } else if (resp.statusCode == 400) {
      print(false);
      print(resp.body);
    }

    // print(resp.body)
  }
}
