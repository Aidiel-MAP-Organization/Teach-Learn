import '../../models/user.dart';
import '../viewmodel.dart';

class HomescreenViewmodel extends Viewmodel {
  User _user = User();

  get user => _user;
  set user(value) => _user = value;

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
}
