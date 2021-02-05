import 'package:finances_app/style.dart';
import 'package:finances_app/views/groups/groups.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Finanças',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(headline1: TitleTextStyle, bodyText1: BodyTextStyle)
        ),
        home: Groups(),
      )
    );
  }
}