import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(250, 252, 255, 253),
      title: Row(
        children: [
          ZoomIn(
              child: Image.asset(
            'images/clotthy2.png',
            fit: BoxFit.contain,
            height: 48,
          )),
        ],
      ),
      actions: [
        Container(
          child: Column(
            children: [ 
              const Divider(
                height: 10,
              ),
              Text(
                'Alberto Carrascales',
                style:
                    TextStyle(color: Colors.black, fontFamily: 'SourceSansPro'),
                textAlign: TextAlign.center,
              ),
              Text(
                'Anlista',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
        ),
        CircleAvatar(
          child: Image.asset(
            'images/Perfil.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
