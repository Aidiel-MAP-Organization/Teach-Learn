import 'package:exercise3/screens/myprofile/editMyProfile/body.dart';
import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:exercise3/screens/myprofile/widget/bar.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/user.dart';

class EditMyProfile extends StatefulWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => EditMyProfile(user: user));

    final User _user;
    EditMyProfile({user})
      : _user = user;

  @override
  _EditMyProfileState createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: MyProfileViewModel(),
          builder: (_, mainViewmodel, __){
            mainViewmodel.setUser(widget._user);
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
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
              body: Body(mainViewmodel),
            );
          },
        )
      ),
    );
  }
}