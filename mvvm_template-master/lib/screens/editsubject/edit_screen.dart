import 'package:exercise3/screens/editsubject/body.dart';
import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/user.dart';

class EditCourse extends StatefulWidget {
  static Route route({user, index}) => MaterialPageRoute(
      builder: (context) => EditCourse(user: user, index: index));

  final User _user;
  final int _index;
  EditCourse({user, index})
      : _user = user,
        _index = index;

  @override
  _EditCourseState createState() => _EditCourseState();
}

class _EditCourseState extends State<EditCourse> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
          child: View(
        viewmodel: TeachscreenViewModel(),
        builder: (_, mainViewmodel, __) {
          mainViewmodel.setUser(widget._user);
          return Scaffold(
            body: Body(viewmodel: mainViewmodel, index: widget._index),
          );
        },
      )),
    );
  }
}
