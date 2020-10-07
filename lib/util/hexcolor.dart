import 'package:flutter/material.dart';

//here we can convert color from hex color into integer
class HexColor extends Color{
  static int _getColorFromHex(String hexColor){
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor,radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//how to use
/*Color color1=HexColor("b74093");*/
//we can pass hexcolor into class so they can convert into integer