import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {

  final Widget? large;
  final Widget? medium;
  final Widget? small;
  final Widget? other;

  const ResponsiveWidget({Key? key, this.large, this.medium, this.small, this.other }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth >= Breakpoints.instance.desktop) {
      return large ?? other ?? medium ?? small ?? SizedBox(height: 0, width: 0);
    }
    else if ( currentWidth < Breakpoints.instance.desktop && currentWidth >= Breakpoints.instance.mobile) {
      return medium ?? other ?? large ?? small ?? SizedBox(height: 0, width: 0);
    }
    else {
      return small ?? other ?? medium ?? large ?? SizedBox(height: 0, width: 0);
    }
    
  }
}