import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/types.dart';
import 'package:flutter/material.dart';

abstract class GroupsView {
  void showInfoPopup(String message);
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