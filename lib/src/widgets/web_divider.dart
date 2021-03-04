import 'package:flutter/material.dart';

class WebDivider extends StatelessWidget {

  final Color? color;
  final double? endIndent;
  final double? height;
  final double? indent;
  final double? thickness;

  const WebDivider({this.color, this.endIndent, this.height, this.indent, this.thickness, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Divider(
        color: color,
        endIndent: endIndent,
        height: height,
        indent: indent,
        thickness: thickness,
      )
    );
  }
}