import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Login/screens/login_screen.dart';
import 'package:mobile/main.dart';

import '../Login/screens/Pqrsf.dart';
import '../Login/screens/Profile.dart';
import '../Login/screens/Company.dart';
import '../Login/screens/Company.dart';
import '../Login/screens/Statistics.dart';

class ButtonDesp extends StatelessWidget {
  const ButtonDesp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeBackgroundColor: Colors.grey,
      backgroundColor: Color.fromARGB(255, 36, 91, 189),
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: Icon(
              Icons.insights,
              color: Colors.white,
            ),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Statistics()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: const Icon(
              FontAwesomeIcons.building,
              color: Colors.white,
            ),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Company()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: const Icon(FontAwesomeIcons.user, color: Colors.white),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: Icon(
              FontAwesomeIcons.question,
              color: Colors.white,
            ),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Pqrsf()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: Icon(FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.white),
            onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  )
                })
      ],
    );
  }
}
