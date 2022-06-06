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
              Spin(child: _HeaderImage(), duration: Duration(seconds: 1)),
              SizedBox(height: 20),
              BounceInUp(
                  child: CardContainer(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          ElasticIn(
                            child: Text("Iniciar sesion",
                                style: Theme.of(context).textTheme.headline5),
                            duration: Duration(seconds: 3),
                          ),
                          SizedBox(height: 30),
                          ChangeNotifierProvider(
                            create: (_) => LoginFormProvider(),
                            child: LoginForm(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  duration: Duration(seconds: 3)),
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

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  bool isHidden = true;
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
            ElasticInLeft(
                child: TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hinText: "correo@gmail.com",
                    labelText: "Correo Electronico",
                    prefixIcon: Icons.alternate_email_rounded,
                  ),
                  onChanged: (value) => loginform.email = value,
                  // validator: (value) {
                  //   String pattern =
                  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  //   RegExp regExp = new RegExp(pattern);

                  //   return regExp.hasMatch(value ?? "")
                  //       ? null
                  //       : "El correo esta mal escrito o tiene un espacio de mas";
                  // },
                  validator: (value) {
                    // cuando esta vacio
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    // cuando falta algo
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Ingrese su email correcto";
                    }
                    // el correo es valido
                    return null;
                  },
                ),
                duration: Duration(seconds: 3)),
            SizedBox(height: 10),
            ElasticInLeft(
                child: TextFormField(
                  autocorrect: isHidden,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecorations.authInputDecoration(
                    hinText: "Ingresa tu contraseña",
                    labelText: "Contraseña",
                    prefixIcon: Icons.lock_outlined,
                    // suffixIcon: togglePasswordVisibility(),
                  ),
                  onChanged: (value) => loginform.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 10) return null;

                    return "La contraseña tiene que tener 10 caracteres";
                  },
                ),
                duration: Duration(seconds: 3)),
            SizedBox(height: 35),
            FlipInX(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Color.fromARGB(255, 36, 91, 189),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        "Ingresar",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      // llama al provider para conectarlo con la api

                      var message = provider.getUsuario(
                          loginform.email, loginform.password, context);

                      // todo login form
                      String sinspa = loginform.email.replaceAll(" ", "");

                      if (!loginform.isValidForm()) return;
                      // print('pepe');
                      if (message.body) {
                        print(message.body);
                        AlertDialog alert = AlertDialog(
                          backgroundColor: Colors.white.withOpacity(0.7),
                          title: const Text('error'),
                          content: const Text('debes llenar todos los campos'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                            ),
                          ],
                        );
                      }
                      // Navigator.pushReplacementNamed(context, "Company");
                    }),
                duration: Duration(seconds: 3)),
            SizedBox(height: 10),
            FlipInX(
                child: MaterialButton(
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
                duration: Duration(seconds: 6)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        isHidden=!isHidden;
      });

    },icon: isHidden?Icon(Icons.visibility) : Icon(Icons.visibility_off),
    color: Colors.grey);
  }
}
