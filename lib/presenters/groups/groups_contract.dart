import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/presenters/groups/groups_state_properties.dart';
import 'package:finances_app/presenters/view_contract.dart';
import 'package:finances_app/types.dart';
import 'package:finances_app/views/groups/groups.dart';
import 'package:flutter/material.dart';

abstract class GroupsView implements View<GroupsStateProperties> {
  void showGroups(List<Group> groupList);
  void addGroup(Group group);
  set changedGroupNameCallback(GroupCallback callback);
  set createGroupCallback(VoidCallback callback);
}

abstract class GroupsPresenter {
  //VoidCallback initView(GroupsState state);
  void fetchAllGroups();
  void createGroup();
  void updateGroup(Group group);
}