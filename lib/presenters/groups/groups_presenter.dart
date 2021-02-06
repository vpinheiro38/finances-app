import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/group.dart';
import 'package:finances_app/presenters/groups/groups_contract.dart';
import 'package:finances_app/services.dart';

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
    database.createGroup(Group(name: 'Novo Grupo'))
        .then((group) => _view.addGroup(group))
        .catchError((error) => _view.showInfoPopup(error.toString()));
  }

  @override
  void fetchAllGroups() {
    database.fetchAllGroups()
        .then((value) => _view.showGroups(value))
        .catchError((error) => _view.showInfoPopup(error.toString()));
    //_view.showGroups([Group(name: "Pessoal"), Group(name: "Empresa Y")]);
  }

}