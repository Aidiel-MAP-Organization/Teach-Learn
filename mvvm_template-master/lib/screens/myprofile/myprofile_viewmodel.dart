import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/services/addsubject/add_service_rest.dart';

import '../../models/user.dart';
import '../viewmodel.dart';

class MyProfileViewModel extends Viewmodel{
  AddServiceRest get _service => dependency();
  User _user = User();
  String newUsername;
  String newName;
  String newPassword;

  void setUser(User value) {
    this._user = value;
    newUsername = _user.login;
    newName = _user.name;
    newPassword = _user.password;
  }
  get user => _user;
  
  get username => _user.login;
  set username(value) {
    newUsername = value;
  }


  get name => _user.name;
  set name(value) {
    newName = value;
  }

  get password => _user.password;
  set password(value) {
    newPassword = value;
  }

  void setNewUser(){
    user.name = newName;
    user.login = newUsername;
    user.password = newPassword;    
  }

  Future<void> updateUser() async{
    setNewUser();
    final newUser = await _service.updateUser(user);
    setUser(newUser);
  }
}