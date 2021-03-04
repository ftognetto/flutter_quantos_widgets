import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget? ifFalse;
  final Widget ifTrue;

  ConditionalWidget({
    required this.condition,
    required this.ifTrue,
    this.ifFalse,
  })  : assert(condition != null),
        assert(ifTrue != null);

  @override
  Widget build(BuildContext context){
    if(condition) { return ifTrue; }
    else if(ifFalse != null) { return ifFalse!; }
    else { return Container(); }
  }
}