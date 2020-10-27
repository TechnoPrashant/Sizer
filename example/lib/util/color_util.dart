import 'package:flutter/material.dart';

class ColorUtil{
  static const String _color1='#FF725E';
  static const String _color2='#BA68C8';
  static const String _color3='#FFC100';
  static const String _color4='#7E57C2';

  static color1() {
    return getColorFromHex(_color1);
  }

  static color2() {
    return getColorFromHex(_color2);
  }

  static color3() {
    return getColorFromHex(_color3);
  }

  static color4() {
    return getColorFromHex(_color4);
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }


}