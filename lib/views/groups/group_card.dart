import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/style.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final String _groupName;
  final Function() _onTextFieldUnfocused;
  final Function(String) _onNameChanged;

  GroupCard(this._groupName, this._onNameChanged, this._onTextFieldUnfocused);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        color: CardColor,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (focused) {
                    if (!focused)
                      _onTextFieldUnfocused();
                  },
                  child: TextField(
                    controller: TextEditingController(text: _groupName),
                    onChanged: _onNameChanged,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )
              ),
              Icon(Icons.chevron_right, color: Colors.blueGrey)
            ],
          )
        )
      ),
    );
  }

}