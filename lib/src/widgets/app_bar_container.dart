import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget with PreferredSizeWidget {

  final Widget child;
  final double height;

  AppBarContainer({Key key, bool expanded = false, @required this.child}) : 
    height = expanded ? 80 : 45,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: child
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}