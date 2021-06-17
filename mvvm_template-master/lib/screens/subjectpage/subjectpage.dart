import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:exercise3/screens/myprofile/widget/bar.dart';
import 'package:exercise3/screens/subjectpage/body.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/user.dart';

class SubjectPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SubjectPage());

  final User _user;
    SubjectPage({user})
      : _user = user;

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
              body: Body(),
            );
          },
        )
      ),
    );
  }
}