import 'package:exercise3/models/subject.dart';

import '../../models/user.dart';

abstract class AuthService {
  Future<User> authenticate({String login, String password});
  Future<Subject> getTodoListByUser({String subjectId});
}
