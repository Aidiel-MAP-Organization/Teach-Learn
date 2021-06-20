import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/homescreen/widget/bar.dart';
import 'package:exercise3/screens/homescreen/widget/body.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'hs_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => HomeScreen(user: user));

  final User _user;

  HomeScreen({user})
      : _user = user;

  @override
  _HomeScreen createState() => _HomeScreen();
}
  
  class _HomeScreen extends State<HomeScreen>{
  int _selectedIndex = 0;

      @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: HomescreenViewmodel(),
          builder: (_, mainViewmodel, __){
            mainViewmodel.setUser(widget._user);
            return Scaffold(
              appBar: Bar(mainViewmodel),
              body: Body(mainViewmodel),
              bottomNavigationBar: BottomNavyBar(
              selectedIndex: _selectedIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
                if (index==0) {
                  Navigator.pushNamed(context, '/homescreen', arguments: widget._user);
                } else if(index==1){
                  Navigator.pushNamed(context, '/teachscreen', arguments: widget._user);
                }else{
                   Navigator.pushNamed(context, '/myprofile');
                }
               }),
              items: [
                BottomNavyBarItem(
                  icon: Icon(FontAwesomeIcons.graduationCap, size: 30),
                  title: Text('Learn'),
                  activeColor: Colors.green,
                ),
                BottomNavyBarItem(
                    icon: Icon(FontAwesomeIcons.chalkboardTeacher, size: 30),
                    title: Text('Teach'),
                    activeColor: Colors.green
                ),
                BottomNavyBarItem(
                    icon: Icon(FontAwesomeIcons.userAlt, size: 30),
                    title: Text('MyProfile'),
                    activeColor: Colors.green
                ),
               ],
               )
            );
          }
        ),
      )
    );
  }
}
