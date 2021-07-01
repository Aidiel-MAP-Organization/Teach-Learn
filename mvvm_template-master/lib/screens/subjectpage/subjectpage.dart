import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:exercise3/screens/subjectpage/body.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/user.dart';

class SubjectPage extends StatefulWidget {
  static Route route({index,user,type}) =>
    MaterialPageRoute(builder: (context) => SubjectPage(index: index, user: user, type: type));

  final User _user;
  final int _index;
  final String _type;
    SubjectPage({index,user,type})
      : _index = index, _user = user, _type = type;

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: MyProfileViewModel(),
          builder: (_, mainViewmodel, __){
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  widget._user.teachSubjectList[widget._index].title
                ),
                backgroundColor: Color(0xFF00AF19),
                leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                  onPressed: () {
                  Navigator.pop(context);
                },
                ),
              ),
              body: Body(index: widget._index, user: widget._user, type: widget._type),
            );
          },
        )
      ),
    );
  }
}