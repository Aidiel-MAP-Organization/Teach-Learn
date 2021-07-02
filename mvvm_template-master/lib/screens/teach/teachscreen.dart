import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:exercise3/screens/teach/widget/bar.dart';
import 'package:exercise3/screens/teach/widget/body.dart';
import 'package:exercise3/screens/teach/widget/float.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeachScreen extends StatefulWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => TeachScreen(user: user));

  final User _user;

  TeachScreen({user})
      : _user = user;

  @override
  _TeachScreen createState() => _TeachScreen();
}
  
  class _TeachScreen extends State<TeachScreen>{

  void update(){
    setState(() {
      });
  }

  int _selectedIndex = 1;

      @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: TeachscreenViewModel(),
          builder: (_, mainViewmodel, __){
            mainViewmodel.setUser(widget._user);
           // setState(() => mainViewmodel.setUser(widget._user));
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
                   Navigator.pushNamed(context, '/myprofile',  arguments: widget._user);
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
              ),
              floatingActionButton: Float(mainViewmodel),
            );
          }
        ),
      )
    );
  }
}
