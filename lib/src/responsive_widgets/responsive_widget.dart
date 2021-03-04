import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {

  final Widget large;
  final Widget? medium;
  final Widget? small;

  const ResponsiveWidget({Key? key, required this.large, this.medium, this.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth >= Breakpoints.instance.desktop) {
      return large;
    }
    else if ( currentWidth < Breakpoints.instance.desktop && currentWidth >= Breakpoints.instance.mobile) {
      return medium ?? large;
    }
    else {
      return small ?? medium ?? large;
    }
    
  }
}