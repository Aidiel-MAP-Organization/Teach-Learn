import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';

class RegServiceRest {
  RestService get rest => dependency();

  Future<String> register(User user) async {
    final json = await rest.post('users',data: user);
    if(json != null)
      return 'success';
    else
      return 'failed';
  }
}
