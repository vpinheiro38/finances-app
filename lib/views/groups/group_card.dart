import 'package:finances_app/style.dart';
import 'package:finances_app/views/groups/groups.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final Group _group;

  GroupCard(this._group);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        color: CardColor,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(_group.name, style: Theme.of(context).textTheme.bodyText1),
              ),
              Container(
                  child: Icon(Icons.chevron_right, color: Colors.blueGrey)
              )
            ],
          )
        )
      ),
    );
  }

}