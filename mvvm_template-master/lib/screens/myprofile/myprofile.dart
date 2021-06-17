import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:exercise3/screens/myprofile/widget/body.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/user.dart';

class MyProfile extends StatefulWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => MyProfile(user: user));

  final User _user;
    MyProfile({user})
      : _user = user;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: MyProfileViewModel(),
          builder: (_, mainViewmodel, __){
            return Scaffold(
              body: Body(mainViewmodel),
            );
          },
        )
      ),
    );
  }
}