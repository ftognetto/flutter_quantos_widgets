import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {

  final Widget tile;
  final double dividerHeight;
  final double dividerIndent;

  const ListDivider({Key? key, required this.tile, this.dividerHeight = 1, this.dividerIndent = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tile,
        Container( color: Colors.transparent, child: Divider(height: dividerHeight, indent: dividerIndent,), )
        
      ],
    );
  }
}