import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import '../api/AllApi.dart';
import 'loginProvider.dart';

class CompanyProvider extends ChangeNotifier {
  // late String token;
  // late String avatar;
  // late String name;
  // late String lastName;
  // late String userName;
  // late String role;

  getCompany(context) async {
    LocalStorage storage = LocalStorage('userLogged');
    // final provider = LoginProvider();
    // print(provider.token);
    // String token = provider.token;
    String url = '/company';
    var userData = storage.getItem('user_data');
    final token = userData['token'];

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, token);
    final bodyResponse = jsonDecode(resp.body);
    String message = "";
    print(bodyResponse);
  }
}
