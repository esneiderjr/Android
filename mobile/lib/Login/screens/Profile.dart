import 'package:flutter/material.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/Login/screens/Statistics.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CLOTTHY",
      theme:
          ThemeData(backgroundColor: const Color.fromARGB(250, 252, 255, 253)),
      home: Profile(),
    );
  }
}

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 36, 91, 189),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Statistics()));
          }),
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
