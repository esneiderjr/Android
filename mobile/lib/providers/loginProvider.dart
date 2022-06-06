import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/AllApi.dart';

class LoginProvider extends ChangeNotifier {
  getUsuario(String email, String password, context) async {
    String url = '/signin/employees';

    Map<String, String> parametros = {
      'email': email,
      'password': password,
      'password_confirmation': password
    };

    // conexion a all api contando los documentos
    final resp = await AllApi.httpPost(url, parametros);
    final bodyResponse = jsonDecode(resp.body);
    final token = bodyResponse['token'];
    String message = "";

    // validacion de ingreso de datos;
    if (resp.statusCode == 200) {
      print(bodyResponse);
      var token = bodyResponse['token'];
      var userName = bodyResponse['user']['username'];
      var role = bodyResponse['user']['user_role_info'][0]['role'];
      
      Navigator.pushReplacementNamed(context, "Company");
    } else if (resp.statusCode == 400) {
      // castea los mensajes de errores y los pone en un show dialog
      if (bodyResponse['message'] is List<dynamic>) {
        for (var m in bodyResponse['message']) {
          message += m + "\n";
        }
      } else {
        message = bodyResponse['message'];
      }
      AlertDialog alert = AlertDialog(
        // backgroundColor: Colors.white.withOpacity(0.7),
        title: const Text('error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          ),
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }
}
