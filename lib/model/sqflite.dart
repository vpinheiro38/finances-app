import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/group.dart';

class SQFLite implements AppDatabase {

  @override
  void createGroup(Group group) {
    // TODO: implement createGroup
  }

  @override
  void deleteGroup(int id) {
    // TODO: implement deleteGroup
  }

  @override
  void updateGroup(Group group) {
    // TODO: implement updateGroup
  }

  @override
  Future<List<Group>> fetchAllGroups() {
    // TODO: implement fetchAllGroups
    throw UnimplementedError();
  }
  
}