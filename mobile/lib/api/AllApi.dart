import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AllApi {
  //ferasApp.php
  static String url = 'https://api.clotthy.com/clotthy-api/clotty-api/api';
  static Dio _dio = new Dio();

  static void configuteDio() {
    // base del url

    _dio.options.baseUrl = url;

    // configurar headers
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      // print(path + '    ' + 'object' + resp.data);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el get');
    }
  }

  static Future<http.Response> httpPost(String path) async {
    final url =
        "https://api.clotthy.com/clotthy-api/clotthy-api/api/signin/employees";
    try {
      return http.post(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      }, body: {
        'email': 'pepito@gmail.com',
        'password': 'admin12345',
        'password_confirmation': 'admin12345'
      });
      // print(path);
      // final resp = await _dio.post('https://api.clotthy.com/clotthy-api/clotty-api/api/signin/employees', data: fromData, options:  Options(contentType: 'application/x-www-form-urlencoded'));
      //1
      //print('object --- > ' + resp.data);
      // return resp.data;
    } catch (e) {
      // print(e.toString());
      throw ('Error en el POST');
    }
  }
}
