import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';

import '../../app/dependencies.dart';
import '../rest.dart';

class AddServiceRest {
  RestService get rest => dependency();

  Future<Subject> addSubject(Subject newSubject) async {
    final json = await rest.post('subjects',data: newSubject);
    if(json != null){
      print(json);
      final _subject = Subject.fromJson(json);
      return _subject;
    }
    
    else
      return null;
  }

  Future<User> updateUser(User user) async {
    String users = "users/" + user.id;
    print(users);
    final json = await rest.put(users,data: user);
    if(json != null){
      print(json);
      final _user = User.fromJson(json);
      print('berjayaaaaa');
      return _user;
    }
    
    else
      return null;
  }

  Future<void> removeSubject(String id) async {
    String json = 'subjects/'+id;
    rest.delete(json);
  }

  Future<Subject> getSearchSubject(String title) async {
    String subjectTitle = 'subjects/?title='+title; 
    final List json = await rest.get(subjectTitle);
    if (json == null || json.length == 0) return null;
    final _result = Subject.fromJson(json[0]);
    return _result;
  }

  Future<Subject> updateSubject(Subject updateSubject) async {
    String id = updateSubject.id;
    String subjectTitle = 'subjects/'+id; 
    final json = await rest.put(subjectTitle,data: updateSubject);
    if (json == null || json.length == 0) return null;
    final _result = Subject.fromJson(json);
    return _result;
  }
  

}
