import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/breakpoints.dart';
import 'package:flutter_quantos_widgets/src/responsive_widgets/responsive_widget.dart';

class ResponsiveScaffold extends StatelessWidget {

  final Widget title;
  final List<Widget> actions;
  final Widget drawer;
  final Widget body;
  final Color color;
  final bool appBarExpanded;
  final double elevation;

  const ResponsiveScaffold({Key key, this.title, this.appBarExpanded = false, this.actions, this.drawer, @required this.body, this.elevation = 0, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AppBar appBar = AppBar(
      elevation: elevation,
      title: title,
      actions: actions,
      iconTheme: IconThemeData(
        color: Colors.white, 
      ),
    );
    

    return ResponsiveWidget(


      large: Scaffold(
        appBar: appBarExpanded ? appBar : PreferredSize(
          preferredSize: Size(Breakpoints.instance.desktop, kToolbarHeight),
          child: Container(
            color: color,
            child: Center(
              child: SizedBox(
                width: Breakpoints.instance.desktop,
                child: appBar
              )
              
            ),
          )
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: Breakpoints.instance.desktop,
              child: drawer != null 
                ? Row(
                  children: <Widget>[
                    drawer,
                    Expanded(child: body)
                  ],
                )
                : body
            )
          ]
        )
        
      ),


      medium: Scaffold(
        appBar: appBar,
        body: drawer != null 
          ? Row(
            children: <Widget>[
              drawer,
              Expanded(child: body)
            ],
          )
          : body
      ),


      small: Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: body
      ),
    );
  }
}
