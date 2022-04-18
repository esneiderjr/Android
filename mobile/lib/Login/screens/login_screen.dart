import 'package:flutter/material.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/Login/screens/Reports.dart';
import 'package:mobile/Login/ui/input_decorations.dart';
import 'package:mobile/login/widgets/widgets.dart';
import 'package:mobile/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

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
                  Text("Iniciar sesion",
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 30),

                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                    ),
                ],
               ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final loginform = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO: Mantener La referencia al key
        key: loginform.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintext: "correo@gmail.com",
                labelText: "Correo Electronico",
<<<<<<< HEAD
                prefixIcon: Icons.alternate_email_rounded,
=======
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
>>>>>>> d5d626af90e930e624e2bc4d0fcbde792d738bcb
              ),
              onChanged: (value) => loginform.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? "")
                  ? null
                  :"El correo esta mal escrito";
              },
            ),
            SizedBox(height:10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintext: "*****",
                labelText: "Contraseña",
<<<<<<< HEAD
                prefixIcon: Icons.lock_outlined,
=======
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
>>>>>>> d5d626af90e930e624e2bc4d0fcbde792d738bcb
              ),
              onChanged: (value) => loginform.password = value,
                validator: (value) {
                if (value != null && value.length >=6) return null;

                return "La contraseña tiene que tener 6 caracteres";
              },
            ),
            SizedBox(height:35),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.lightBlue[800],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text("Ingresar"),
              ),
              onPressed: () {
                //todo login form
                if (!loginform.isValidForm()) return;
                Navigator.pushReplacementNamed(context, "home");
              }),
            // ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all<Color>(
            //             Color.fromARGB(255, 36, 91, 189))),
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Reports()));
            //     },
            //     child: Text('Iniciar sesion'))
          ],
        ),
      ),
    );
  }
}
