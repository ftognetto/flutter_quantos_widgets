import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/breakpoints.dart';


class ResponsiveBuilder extends StatelessWidget {

  final Widget Function(BuildContext, Breakpoint) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth >= Breakpoints.instance.desktop) {
      return builder(context, Breakpoint.DESKTOP);
    }
    else if ( currentWidth < Breakpoints.instance.desktop && currentWidth >= Breakpoints.instance.mobile) {
      return builder(context, Breakpoint.TABLET);
    }
    else {
      return builder(context, Breakpoint.MOBILE);
    }
    
  }
}