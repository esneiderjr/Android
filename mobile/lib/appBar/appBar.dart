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
      backgroundColor: const Color.fromARGB(250, 252, 255, 253),
      leading: Container(
        width: 60,
        height: 70,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/clotthy2.png'),
        )),
      ),
    );
  }
}
