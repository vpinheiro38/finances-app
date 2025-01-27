import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/presenters/groups/groups_contract.dart';
import 'package:finances_app/presenters/groups/groups_presenter.dart';
import 'package:finances_app/style.dart';
import 'package:finances_app/types.dart';
import 'package:finances_app/views/groups/group_card.dart';
import 'package:finances_app/widgets/dialog_popup.dart';
import 'package:finances_app/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  @override
  GroupsState createState() => GroupsState();
}

class GroupsState extends State<Groups> implements GroupsView {
  final Tween<Offset> _slideOffset = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  final Tween<double> _slideFade = Tween(begin: 0, end: 1);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  GroupsPresenter _presenter;

  GroupCallback _changedGroupNameCallback;
  VoidCallback _createGroupCallback;

  List<Group> _groupList = [];

  @override
  void initState() {
    super.initState();

    _presenter = GroupsPresenterImpl(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _presenter.fetchAllGroups();
    });
  }

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
                      IconButton(icon: Icon(Icons.add, color: TextColor), onPressed: _createGroupCallback)
                    ],
                  )
              ),
              Expanded(
                child: AnimatedList(
                    key: _listKey,
                    initialItemCount: _groupList.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(_slideOffset),
                        child: FadeTransition(
                          opacity: animation.drive(_slideFade),
                          child: GroupCard(_groupList[index].name, (newName) => _groupList[index].name = newName, () => _changedGroupNameCallback(_groupList[index])),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        )

    );
  }


  @override
  set changedGroupNameCallback(callback) {
    _changedGroupNameCallback = callback;
  }

  @override
  set createGroupCallback(callback) {
    _createGroupCallback = callback;
  }

  @override
  void showGroups(List<Group> groupList) {
    Future delay = Future((){});
    groupList.forEach((group) {
      delay = delay.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _groupList.add(group);
          _listKey.currentState.insertItem(_groupList.length - 1);
        });
      });
    });
  }

  @override
  void addGroup(Group group) {
    _groupList.add(group);
    _listKey.currentState.insertItem(_groupList.length - 1);
  }

  @override
  void showInfoPopup(String message){
    var dialog = DialogPopup.buildDialog(
        message: message,
        confirm: "OK",
        confirmFn: () => Navigator.pop(context));
    showDialog(context: context, child: dialog);
  }

}