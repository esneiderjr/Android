import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/companyProvider.dart';

class AllApi {
  //ferasApp.php
  static String starUrl = 'https://api.clotthy.com/api';
  // static Dio _dio = new Dio();
  static Future<http.Response> httpGet(String path, token) async {
    final url = starUrl + path;

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/x-www-form-urlencoded charset=UTF-8",
      "Authorization": "Bearer " + token,
    });

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      return response;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load get');
    }
  }
  // return http.get(
  //   Uri.parse(url),
  //   headers: <String, String>{
  //     "Authorization": "Bearer " + token,
  //     'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
  //   },
  // );

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
