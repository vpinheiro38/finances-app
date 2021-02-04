import 'package:finances_app/style.dart';
import 'package:finances_app/views/groups/group_card.dart';
import 'package:finances_app/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  Groups() : super();

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {

  List<Group> _groupList = [Group("Pessoal"), Group("Empresa Y")];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                children: [
                  Expanded(child: Text("Finanças", style: Theme.of(context).textTheme.headline1)),
                  Icon(Icons.add, color: TextColor,)
                ],
              )
            ),
            ..._groupList.map((group) => Row(children: [Expanded(child: GroupCard(group))]))
          ],
        ),
      )

    );
  }
}

class Group {
  final String name;

  Group(this.name);
}