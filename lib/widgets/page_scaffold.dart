import 'package:finances_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  final Widget header;

  PageScaffold({this.header, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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