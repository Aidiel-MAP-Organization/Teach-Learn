import 'package:exercise3/models/subject.dart';

class User {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  String _photoUrl;
  String _login;
  String _password;
  List <dynamic>_subject;
  List <dynamic>_teach;
  List <Subject> _subjectList = [];
  List <Subject> _teachSubjectList = [];

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get subjectList => _subjectList;
  // set setsubjectList(Subject value){
    
  // }
  void setsubjectList({Subject value}) {
      _subjectList.add(value);
  }

  get teachSubjectList => _teachSubjectList;
  // set setsubjectList(Subject value){
    
  // }
  void setTeachubjectList({Subject value}) {
      _teachSubjectList.add(value);
  }

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  get login => _login;
  set login(value) => _login = value;

  get password => _password;
  set password(value) => _password = value;

  get subject => _subject;
  set subject(value) => _subject = value;

  get teach => _teach;
  set teach(value) => _teach = value;

  User(
      {dynamic id,
      String name = '',
      String photoUrl = '',
      String login = '',
      String password = '',
      List subject,
      List teach})
      : _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _login = login,
        _password = password,
        _subject = subject,
        _teach = teach;

  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            photoUrl: from.photoUrl,
            login: from.login,
            password: from.password,
            subject: from.subject,
            teach: from.teach);

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          photoUrl: json['photoUrl'],
          login: json['login'],
          password: json['password'],
          subject: json['subject'],
          teach: json['teach']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'login': login,
        'password': password,
        'subject' : subject,
        'teach' : teach,
      };


}
