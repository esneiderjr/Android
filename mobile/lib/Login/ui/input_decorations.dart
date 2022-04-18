import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({
    required String hintext,
    required String labelText,
    IconData? prefixIcon,
  }){
    return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 134, 136, 134),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 47, 255),
                    width: 2,
                  ),
                ),
                hintText: hintext,
                labelText: labelText,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: prefixIcon != null 
                ? Icon( prefixIcon, color: Colors.blue)
                : null);
  }

}