import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/companyProvider.dart';

class AllApi {
  static String starUrl = 'https://api.clotthy.com/api';

  static Future<http.Response> httpGet(String path, token) async {
    final url = starUrl + path;
    // print(url);
    try {
      return http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/x-www-form-urlencoded charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
    } catch (e) {
      throw ('Error en el POST');
    }
  }

  static Future<http.Response> httpPost(String path, parametros) async {
    final url = starUrl + path;
    // print(url);
    try {
      return http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
          body: parametros);
    } catch (e) {
      throw ('Error en el POST');
    }
  }
}
