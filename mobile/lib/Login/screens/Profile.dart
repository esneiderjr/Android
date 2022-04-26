import 'package:flutter/material.dart';

import '../../button/Button.dart';
import 'Statistics.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      floatingActionButton: ButtonDesp(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            alignment: Alignment.centerRight,
            child: Image.asset('images/descarga.png'),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Usuario  '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Apellidos  '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration:
                  InputDecoration(hintText: 'Numero de identificacion  '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Fecha de creacion  '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Genero  '),
            ),
          ),
        ],
      ),
    );
  }
}
