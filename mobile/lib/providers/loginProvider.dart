import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/Modal/Modal.dart';
import 'package:mobile/api/ApiMessages.dart';
import 'package:mobile/models/LoginModel.dart';
import '../api/AllApi.dart';

// class LoginProvider extends ChangeNotifier {
//   late String token;
//   late String avatar;
//   late String name;
//   late String lastName;
//   late String userName;
//   late String role;

//   getUsuario(String email, String password, context) async {
//     final LocalStorage storage = LocalStorage('userLogged');

//     String url = '/signin/employees';
//     Map<String, String> parametros = {
//       'email': email,
//       'password': password,
//       'password_confirmation': password
//     };

//     // conexion a all api contando los documentos
//     final resp = await AllApi.httpPost(url, parametros);
//     final bodyResponse = jsonDecode(resp.body);
//     String message = "";

//     // validacion de ingreso de datos;
//     if (resp.statusCode == 200) {
//       // print(bodyResponse);
//       this.token = bodyResponse['token'];
//       this.userName = bodyResponse['user']['username'];
//       this.role = bodyResponse['user']['user_role_info'][0]['role'];
//       this.name = bodyResponse['user']['first_name'];
//       this.lastName = bodyResponse['user']['last_name'];
//       this.avatar = bodyResponse['user']['avatar'];

//       storage.setItem('user_data', bodyResponse);
      

//       Navigator.pushReplacementNamed(context, "Company");
//     } else if (resp.statusCode == 400) {
//       // castea los mensajes de errores y los pone en un show dialog
//       if (bodyResponse['message'] is List<dynamic>) {
//         for (var m in bodyResponse['message']) {
//           message += m + "\n";
//         }
//       } else {
//         message = bodyResponse['message'];
//       }
//       AlertDialog alert = AlertDialog(
//         // backgroundColor: Colors.white.withOpacity(0.7),
//         title: const Text('error'),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('OK'),
//             onPressed: () {
//               Navigator.pop(context, 'OK');
//             },
//           ),
//         ],
//       );
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return alert;
//           });
//     }
//   }
// }

class LoginProvider extends ChangeNotifier {
  final LocalStorage storage = LocalStorage('session');
  final List<String> requiredRoles = ["administrador general", "superuser"];

  signin(Map<String, String> data, context) async {
    String path = '/signin/employees';
    final res = await AllApi.httpPost(path, data);
    Map<String, dynamic> dataMap = jsonDecode(res.body);
    String message = "";

    if(res.statusCode == 200){
      final user = User.fromJson(dataMap);
      if(user.userData != null){
        final isAllowed = validateUserRole(user);
        if(isAllowed){
          storage.setItem('user_logged', {
            'user': user.userData?.toJson(),
            'token': user.token,
            'created_at': DateTime.now().toString()
          });

          Navigator.pushReplacementNamed(context, 'Company');
        } else {
          showModal(
            "No tienes el rol requerido para ingresar \n" 
            "- administrador general \n" 
            "- superuser",
            context
          );
          logout(user.token, context, false);
        }
      }
    } else if(res.statusCode == 400){
      final apiMessages = ApiMessages();
      apiMessages.getMessages(dataMap, context);
    }
  }

  logout(token, context, redirect) async {
    String path = "/logout-employees";
    final res = await AllApi.httpGet(path, token);
    storage.deleteItem("user_logged");

    if(redirect) Navigator.pushReplacementNamed(context, 'login');
  }

  bool validateUserRole(User user){
    List<UserRoleInfo>? roles;
    bool hasRole = false;

    if(user.userData != null){
      roles = user.userData!.userRoleInfo;
      hasRole = roles!.any((item) => requiredRoles.contains(item.role!.toLowerCase()));
    }

    return hasRole;
  }

  void showModal(message, context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Modal(
          title: "Advertencia", 
          textContent: message, 
          icon: Icons.warning_amber_rounded,
          iconColor: Colors.orange
        );
      }
    );
  }
}

