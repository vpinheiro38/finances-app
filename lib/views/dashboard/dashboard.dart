import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/style.dart';
import 'package:finances_app/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final Group _group;

  Dashboard(this._group);

  @override
  State<StatefulWidget> createState() => _DashboardState(_group);
}

class _DashboardState extends State<Dashboard> {
  final Group _group;

  _DashboardState(this._group);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      header: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 20, 20),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back, color: TextColor), onPressed: () => Navigator.pop(context), padding: const EdgeInsets.all(0)),
              Expanded(child: Text("Finanças - ${_group.name}", style: Theme.of(context).textTheme.headline1)),
            ],
          )
      ),
    );
  }

}