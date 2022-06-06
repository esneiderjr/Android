import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Login/screens/Profile.dart';
import 'package:provider/provider.dart';
import '../providers/loginProvider.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

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
              Divider(
                height: 10,
              ),
              Text(
                provider.userName,
                style:
                    TextStyle(color: Colors.black, fontFamily: 'SourceSansPro'),
                textAlign: TextAlign.center,
              ),
              Text(
                provider.role,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
        CircleAvatar(
          child: Image.network(
            provider.avatar,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
