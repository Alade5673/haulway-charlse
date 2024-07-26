import 'package:flutter/material.dart';

class AppColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const Color darkBlue = Color.fromRGBO(36, 59, 77, 1.0);

  static Color nextClr = fromHex('#222222');
  static Color primaryClr = Colors.red;
  static const Color darkGrey = Color.fromRGBO(48, 48, 48, 1);
  static Color lightGrey = fromHex('#ECF0FF');
}
