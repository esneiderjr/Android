import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Login/screens/Pqrsf.dart';
import '../Login/screens/Profile.dart';
import '../Login/screens/Reports.dart';
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
              Icons.contact_page,
              color: Colors.white,
            ),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Reports()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child:
                const Icon(Icons.perm_identity_outlined, color: Colors.white),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: Icon(
              Icons.priority_high,
              color: Colors.white,
            ),
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Pqrsf()))
                }),
        SpeedDialChild(
            backgroundColor: Color.fromARGB(255, 36, 91, 189),
            child: Icon(Icons.login, color: Colors.white))
      ],
    );

    ;
  }
}
