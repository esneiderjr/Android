import 'package:flutter/material.dart';
import 'package:mobile/login/screens/screens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clotthy',
      initialRoute: "login",
      routes: {
        "login": (_) => LoginScreen(),
        "home": (_) => HomeScreen(),
      },
    );
  }
}
