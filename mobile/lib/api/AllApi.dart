import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../providers/loginProvider.dart';

class AllApi {
  //ferasApp.php
  static String starUrl = 'https://api.clotthy.com/api';
  // static Dio _dio = new Dio();
  static Future<http.Response> httpGet(String path, parametros) async {
    final url = starUrl + path;
    // print(url);
    try {
      return http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
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
