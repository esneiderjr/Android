import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Login/ui/input_decorations.dart';
import 'package:mobile/login/widgets/widgets.dart';
import 'package:mobile/providers/loginProvider.dart';
import 'package:mobile/providers/login_form_provider.dart';
import "package:provider/provider.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElasticIn(child: _HeaderImage()),
              SizedBox(height: 20),
              CardContainer(
                child: Center(
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
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        child: Image.asset(
          'images/clotthy.png',
          height: 135,
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginform = Provider.of<LoginFormProvider>(context);
    final provider = Provider.of<LoginProvider>(context, listen: false);

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
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (value) => loginform.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? "")
                    ? null
                    : "El correo esta mal escrito o tiene un espacio de mas";
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintext: "**********",
                labelText: "Contraseña",
                prefixIcon: Icons.lock_outlined,
              ),
              onChanged: (value) => loginform.password = value,
              validator: (value) {
                if (value != null && value.length >= 10) return null;

                return "La contraseña tiene que tener 10 caracteres";
              },
            ),
            SizedBox(height: 35),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Color.fromARGB(255, 36, 91, 189),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    "Ingresar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    // style: Theme.of(context).textTheme.headline6
                  ),
                ),
                onPressed: () {
                  provider.getUsuario(context);
                  // _controller.forward(from: 0.0);
                  //todo login form
                  // String sinspa = loginform.email.replaceAll(" ", "");

                  // if (!loginform.isValidForm()) return;
                  // Navigator.pushReplacementNamed(context, "Company");
                }),

            SizedBox(height: 10),
            MaterialButton(
                child: Container(
                  child: Text("¿Ha olvidado su contraseña?",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                onPressed: () {
                  //todo login form
                  if (!loginform.isValidForm()) return;
                  Navigator.pushReplacementNamed(
                      context, "Recuperar Contraseña");
                }),
            SizedBox(height: 30),
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
