import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../appBar/appBar.dart';
import '../../button/Button.dart';

class Statistics extends StatefulWidget {
  Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: ButtonDesp(),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
      child: ListView(
    children: [boton(), imagen()],
  ));
}

Widget boton() {
  return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 1.0,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Gráficos",
          style: TextStyle(
            fontFamily: 'rlight',
            fontSize: 30,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            child: Icon(FontAwesomeIcons.arrowRotateRight, size: 22),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) =>  Statistics()));
            },
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Color.fromARGB(255, 36, 91, 189),
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ]));
}

Widget imagen() {
  return Center(child: Image.asset('images/background_decoration.png'));
}
