// import 'dart:convert';
// // import 'package:dbcrypt/dbcrypt.dart';
// import 'package:flutter/material.dart';

// import '../api/AllApi.dart';
// // import '../class/notifi.dart';
// import '../models/modeloUsuarios.dart';

// class LoginProvider extends ChangeNotifier {
//   List<Usuario> usuario = [];
//   String rol = '0';

//   String email = '';
//   String password = '';

//   getUsuario(String email, String password, BuildContext context) async {
//     String url = '/webService.php?case=1&email=$email';
//     print(url);
//     final resp = await AllApi.httpGet(url);
//     print(resp);
//     final dataMap = jsonDecode(resp);

//     final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
//     this.usuario = usuarios.dato;
//     if (usuarios.dato[0].rp == 'no') {
//       NotificationService.showSnackBarError('Usuario no Existe');
//     } else {
//       String bd = usuarios.dato[0].password.toString();
//       print(password);
//       print(bd);
//       var isCorrect = DBCrypt().checkpw(password, bd);

//       if (isCorrect) {
//         print('*******************');

//         if (usuario[0].roleId == '1') {
//           Navigator.pushNamedAndRemoveUntil(context, '/index', (route) => false,
//           );
//           FocusScope.of(context).unfocus();
//           print('**********11111111111111111*********');
//         } else {
//           // Navigator.pushNamed(context, 'MainPages');
//           print('*********2222222222222222**********');
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             '/login',
//             (route) => false,
//           );
//           //nueva direccion
//         }
//       } else {}
//       //notifyListeners();
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../api/AllApi.dart';
import '../models/modeloUsuarios.dart';

class LoginProvider extends ChangeNotifier {
  String email = 'pepito@gmail.com';
  String password = 'admin12345';
  String passwordConfirmation = 'admin12345';
  List<Usuario> usuarios = [];

  getUsuario(BuildContext context) async {
    String url = '/signin/employees';

    Map<String, String> parametros = {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation
    };

    final resp = await AllApi.httpPost(url);
    // print(resp.body);
    final dataMap = jsonDecode(resp.body);
    print(dataMap.user);
    // final Usuarios usuarios = Usuarios.fromlist(dataMap['res']);
    // this.usuarios = usuarios.dato;
    // print(usuarios); 

    Navigator.pushReplacementNamed(context, "Company");
  }
}
