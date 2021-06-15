import 'package:exercise3/services/register_service/reg_service_rest.dart';
import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class RegisterViewmodel extends Viewmodel {
  RegServiceRest get _service => dependency();
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

  Future<String> register() async {
    final String message = await _service.register(_user);
    return message;
  }
}
