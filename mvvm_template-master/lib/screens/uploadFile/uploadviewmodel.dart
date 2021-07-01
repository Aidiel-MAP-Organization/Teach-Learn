import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/subject.dart';
import 'package:exercise3/services/addsubject/add_service_rest.dart';

import '../../models/user.dart';
import '../viewmodel.dart';

class UploadViewmodel extends Viewmodel {
  AddServiceRest get _service => dependency();
  User _user = User();
  int _index;

  get user => _user;
  //set user(value) => _user = value;

  void setUser(User value) {
    this._user = value;
  }

  get index => _index;
  set index(value) {
    _index = value;
  }

  get username => _user.login;
  set username(value) {
    _user.login = value;
  }

  get name => _user.name;
  set name(value) {
    _user.name = value;
  }

  get password => _user.password;
  set password(value) {
    _user.password = value;
  }

  Future<Subject> updateSubject(Subject updateSubject) async {
    turnBusy();
    final Subject a = await _service.updateSubject(updateSubject);
    print(a.title);
    return a;
  }

}
