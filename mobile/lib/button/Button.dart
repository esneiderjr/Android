import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/providers/logoutprovider.dart';
import 'package:provider/provider.dart';
import '../Login/screens/Pqrsf.dart';
import '../Login/screens/Profile.dart';
import '../Login/screens/Company.dart';
import '../Login/screens/Statistics.dart';
import '../providers/loginProvider.dart';

class ButtonDesp extends StatelessWidget {
  const ButtonDesp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('userLogged');
    final provider = Provider.of<LogoutProvider>(context, listen: false);
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Statistics()))
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
                  provider.logout(),
                  storage.deleteItem('user_data'),
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (route) => false,
                  )
                })
      ],
    );
  }
}
