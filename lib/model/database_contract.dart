import 'dart:async';
import 'package:finances_app/model/models/group.dart';

abstract class AppDatabase {
  Future<List<Group>> fetchAllGroups();
  void createGroup(Group group);
  void updateGroup(Group group);
  void deleteGroup(int id);
}