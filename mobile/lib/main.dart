// import 'package:flutter/material.dart';
// import 'package:mobile/Login/screens/Pqrsf.dart';
// import 'package:mobile/Login/screens/Reports.dart';
// import 'package:mobile/appBar/appBar.dart';
// import 'package:mobile/login/screens/screens.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Clotthy',
//       initialRoute: "login",
//       routes: {
//         "login": (context) => LoginScreen(),
//         "Reports": (contex) => Reports(),
//       },
//     );
//   }
// }

// esta parte del codigo es para probar cosas en especifico

import 'package:flutter/material.dart';

// import 'package:mobile/appBar/silverAppBar.dart';
import 'Login/screens/prueba.dart';
import 'button/Button.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Prueba(),
    );
  }
}
