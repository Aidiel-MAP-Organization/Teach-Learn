import 'package:exercise3/models/subject.dart';

import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User _user = User();
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get user => _user;
  set user(value) => _user = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  get username => _user.login;
  set username(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.login = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.password = value;
    turnIdle();
  }

  Future<User> authenticate() async {
    turnBusy();
    final User a =
        await _service.authenticate(login: username, password: password);
    if (a == null) _showErrorMessage = true;
    turnIdle();
    return a;
  }

  Future<List<Subject>> getSubject({subjectCode}) async {

    List<Subject> subject = [];
    
    for (int i=0;i<subjectCode.length;i++){
        final Subject a = await _service.getTodoListByUser(subjectId: subjectCode[i]);
        print(a.title);
          if(a!=null){
            subject.add(a);
          }   
    }
    return subject;
  }

}
