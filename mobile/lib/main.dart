import 'package:flutter/material.dart';
import 'package:mobile/Login/screens/EditCompany.dart';
import 'package:mobile/Login/screens/Pqrsf.dart';
import 'package:mobile/Login/screens/Company.dart';
import 'package:mobile/appBar/appBar.dart';
import 'package:mobile/login/screens/screens.dart';
import 'package:mobile/providers/companyProvider.dart';
import 'package:mobile/providers/loginProvider.dart';
import 'package:mobile/providers/logoutprovider.dart';
import 'package:provider/provider.dart';
import 'Login/SplashScreen/splashscreen.dart';
import 'api/AllApi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        //--------- provider login --------------
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => CompanyProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => LogoutProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clotthy',
      initialRoute: "SplashScreen",
      routes: {
        "SplashScreen": (_) => SplashScreen(),
        "login": (_) => LoginScreen(),
        "Company": (_) => Company(),
        "EditCompany": (_) => EditCompany(),

      },
    );
  }
}

// esta parte del codigo es para probar cosas en especifico

// import 'package:flutter/material.dart';
// import 'package:mobile/Login/screens/Statistics.dart';

// // import 'package:mobile/appBar/silverAppBar.dart';
// import 'Login/SplashScreen/splashscreen.dart';
// import 'Login/Widgets/line_chart_page.dart';
// import 'Login/screens/prueba.dart';
// import 'button/Button.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Statistics(),
//     );
//   }
// }
