import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/style.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final String _groupName;
  final Function() _onTextFieldUnfocused;
  final Function(String) _onNameChanged;
  final Function() _onCardPressed;

  GroupCard(this._groupName, this._onNameChanged, this._onTextFieldUnfocused, this._onCardPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: GestureDetector(
        onTap: _onCardPressed,
        child: Card(
            color: CardColor,
            child: Padding(
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.chevron_right, color: Colors.blueGrey),
                      ),
                    )
                  ],
                )
            )
        ),
      )
    );
  }

}