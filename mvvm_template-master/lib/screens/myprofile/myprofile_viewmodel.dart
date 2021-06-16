import '../../models/user.dart';
import '../viewmodel.dart';

class MyProfileViewModel extends Viewmodel{
  User _user = User();

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
}