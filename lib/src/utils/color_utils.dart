import 'package:flutter/widgets.dart';

class ColorUtils{
  static Color colorFromHex(String s) => _ColorFormatter().fromHex(s);
  static String hexFromColor(Color c) => _ColorFormatter().toHex(c);
}

class _ColorFormatter {

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  String toHex(Color color, {bool leadingHashSign = false}) => '${leadingHashSign ? '#' : ''}'
      '${color.alpha.toRadixString(16)}'
      '${color.red.toRadixString(16)}'
      '${color.green.toRadixString(16)}'
      '${color.blue.toRadixString(16)}';
}