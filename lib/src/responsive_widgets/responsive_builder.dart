import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/breakpoints.dart';


class ResponsiveBuilder extends StatelessWidget {

  final Widget Function(BuildContext, Widget?) large;
  final Widget Function(BuildContext, Widget?)? medium;
  final Widget Function(BuildContext, Widget?)? small;
  final Widget? child;

  const ResponsiveBuilder({Key? key, required this.large, this.medium, this.small, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth >= Breakpoints.instance.desktop) {
      return large(context, child);
    }
    else if ( currentWidth < Breakpoints.instance.desktop && currentWidth >= Breakpoints.instance.tablet) {
      return medium != null ? medium!(context, child) : large(context, child);
    }
    else {
      return small != null ? small!(context, child) : medium != null ? medium!(context, child) : large(context, child);
    }
    
  }
}