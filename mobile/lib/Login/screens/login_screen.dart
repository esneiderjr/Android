import 'package:flutter/material.dart';
import 'package:mobile/login/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 200),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Iniciar sesion", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 30),
                    _LoginForm(),                   
                  ],
                )
              ),
              SizedBox(height: 50),
              Text(
                "Hola :)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

              )
            ],
          ),
        ),
       ),
    );
  }
}

class _LoginForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 134, 136, 134),
                  ),
                ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 47, 255),
                        width: 2,
                   ),
                 ),
                 hintText: "Correo@gmail.com",
                 labelText: "Correo Electronico",
                 labelStyle: TextStyle(
                   color: Colors.grey,
                 ),
                 prefixIcon: Icon(
                   Icons.alternate_email_sharp,
                   color: Color.fromARGB(255, 6, 106, 255),
                 ),
               ),
             ),
             TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 134, 136, 134),
                  ),
                ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 47, 255),
                        width: 2,
                   ),
                 ),
                 hintText: "Escribe tu contraseña",
                 labelText: "Contraseña",
                 labelStyle: TextStyle(
                   color: Colors.grey,
                 ),
                 prefixIcon: Icon(
                   Icons.lock,
                   color: Color.fromARGB(255, 6, 106, 255),
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}