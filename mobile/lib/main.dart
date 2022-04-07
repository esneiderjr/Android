import 'package:flutter/material.dart';
import 'Reports.dart';
import 'Login/Login.dart';

void main() => runApp(Mobile());

class Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'mobile', home: Login());
  }
}
