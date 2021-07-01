import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/subject.dart';
import 'package:exercise3/services/addsubject/add_service_rest.dart';

import '../../models/user.dart';
import '../viewmodel.dart';

class TeachscreenViewModel extends Viewmodel {
  AddServiceRest get _service => dependency();
  User _user = User();
  String _title;
  String _description;
  String _price;
  int _counter;


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

  get title => _title;
  set title(value) {
    this._title = value;
  }

  get description => _description;
  set description(value) {
    _description = value;
  }

  get price => _price;
  set price(value) {
    _price = value;
  }

  get counter => _counter;
  set counter(value) {
    _counter = value;
  }

  Subject setnewSubject(){
    Subject newSubject = new Subject(
      title: _title,
      description: _description,
      price: int.parse(_price),
      counter: 0,
      videoUrl: [''],
      imageUrl: [''],
      pdfUrl: [''],
    );
    return newSubject;
  }

  Future<Subject> addnewSubject() async {
    Subject m = setnewSubject();
    turnBusy();
    final Subject a = await _service.addSubject(m);
    return a;
  }

  Future<User> updateUser(User user) async {
    turnBusy();
    final User a = await _service.updateUser(user);
    return a;
  }

  Future<void> removeSubject(String subjectID) async {

    await _service.removeSubject(subjectID);

  }


}