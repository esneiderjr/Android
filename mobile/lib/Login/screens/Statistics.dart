import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Graficos'),
      ),
      floatingActionButton: ButtonDesp(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            alignment: Alignment.center,
            child: Image.asset('images/background_decoration.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    // padding:EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // color:Color.fromARGB(255, 2, 69, 185)
                  )),
            ],
          )
        ],
      ),
    );
    ;
  }
}
