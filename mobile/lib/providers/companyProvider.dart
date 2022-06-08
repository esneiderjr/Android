import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/AllApi.dart';
import 'loginProvider.dart';

class CompanyProvider extends ChangeNotifier {
  late String token;
  late String avatar;
  late String name;
  late String lastName;
  late String userName;
  late String role;

  getCompany(context) async {
    final provider = Provider.of<LoginProvider>(context);
    // String token = provider.token;
    String url = '/company';

    // conexion a all api contando los documentos
    final resp = await AllApi.httpGet(url, provider.token);
    final bodyResponse = jsonDecode(resp.body);
    // String message = "";
    print(bodyResponse);

    ;
  }
}
