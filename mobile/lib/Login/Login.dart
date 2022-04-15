import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset('images/clotthy.png',
                 height:200.0,
              
                ),
              ),
              SizedBox(height:15.0,),
              userTextField(),
               SizedBox(height:15,),
               passwordTextField(),
               SizedBox(height:20.0,),
               bottonLogin(),
            ],
          ),
        ),      
      )
    );
  }

  Widget userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Ejemplo@gmail.com',
              labelText: 'Correo electronico',
            ),
            onChanged: (value){

            }
          ),
        );
      }
    );
  }

  Widget passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Ingresa tu contraseña',
            ),
            onChanged: (value){

            }
          ),
        );
      }
    );
  }

  Widget bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Iniciar sesion',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
             ),
            ),
          ),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 0, 89, 255),
          onPressed:(){}
        );
      }
    );
  }
}

