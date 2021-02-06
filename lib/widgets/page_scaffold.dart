import 'package:flutter/material.dart';
import 'package:finances_app/style.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  final Widget header;

  PageScaffold({this.header, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header != null ? header : Container(),
            child != null ? child : Container()
          ],
        ),
      )
    );
  }

}