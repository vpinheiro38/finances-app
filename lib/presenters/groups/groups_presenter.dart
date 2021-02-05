import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/presenters/groups/groups_contract.dart';
import 'package:finances_app/services.dart';
import 'package:finances_app/views/groups/groups.dart';
import 'package:flutter/material.dart';

class GroupsPresenterImpl implements GroupsPresenter {
  final GroupsView _view;
  final AppDatabase database = services<AppDatabase>();

  GroupsPresenterImpl(this._view) {
    _view.changedGroupNameCallback = updateGroup;
    _view.createGroupCallback = createGroup;
  }

  @override
  void updateGroup(Group group) {
    database.updateGroup(group);
  }

  @override
  void createGroup() {
    //database.createGroup(group);
    _view.addGroup(Group(2, 'Novo Grupo'));
  }

  @override
  void fetchAllGroups() {
    //database.fetchAllGroups().then((value) => _view.showGroups(value));
    _view.showGroups([Group(0, "Pessoal"), Group(1, "Empresa Y")]);
  }

}