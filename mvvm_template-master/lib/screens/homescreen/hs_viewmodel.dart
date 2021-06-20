import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/subject.dart';
import 'package:exercise3/services/addsubject/add_service_rest.dart';

import '../../models/user.dart';
import '../viewmodel.dart';

class HomescreenViewmodel extends Viewmodel {
  AddServiceRest get _service => dependency();
  User _user = User();
  String _search;

  get user => _user;
  //set user(value) => _user = value;

  void setUser(User value) {
    this._user = value;
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

  get subject => _user.subject;
  set subject(value) {
    _user.subject = value;
  }

  get search => _search;
  set search(value) {
    _search = value;
    print(search);
  }

  void printsomething(){
    print('asdas');
  }

  Future<Subject> getSubject(subjectName) async {

    final Subject result = await _service.getSearchSubject(subjectName); 
    return result;
  }
}
