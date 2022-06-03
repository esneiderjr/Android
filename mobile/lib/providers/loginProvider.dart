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

    final resp = await AllApi.httpPost(url, parametros);
    final bodyResponse = jsonDecode(resp.body);
    final token = bodyResponse['token'];

    // final message0 = bodyResponse['message'][0];
    // final message1 = bodyResponse['message'][1];
    // final message = message0 + " " + message1;

    // print(message.runtimeType);

    if (resp.statusCode == 200) {
      Navigator.pushReplacementNamed(context, "Company");
    } else if (resp.statusCode == 400) {
      AlertDialog alert = AlertDialog(
        // backgroundColor: Colors.white.withOpacity(0.7),
        title: const Text('error'),
        // content: Text(message),
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

    // print(resp.body)
  }
}
