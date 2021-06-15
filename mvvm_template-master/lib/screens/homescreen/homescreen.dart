import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:exercise3/screens/homescreen/widget/bar.dart';
import 'package:exercise3/screens/homescreen/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => HomeScreen());

  @override
  _HomeScreen createState() => _HomeScreen();
}
  
  class _HomeScreen extends State<HomeScreen>{

  int _currentIndex = 0;
  int _selectedIndex = 0;

      @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _currentIndex,
          //   backgroundColor: Colors.white,
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(FontAwesomeIcons.graduationCap, size: 30),
          //       label: 'Learn',
          //       backgroundColor: Colors.greenAccent
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(FontAwesomeIcons.chalkboardTeacher, size: 30),
          //       label: 'Teach',
          //       backgroundColor: Colors.greenAccent
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(FontAwesomeIcons.userAlt, size: 30),
          //       label: 'MyProfile',
          //       backgroundColor: Colors.greenAccent
          //     )
          //   ],
          //   onTap: (index){
          //     setState(() {
          //       _currentIndex = index;
          //       if (index==1) {
          //         Navigator.pushNamed(context, '/register');
          //       } else {
          //       }
          //     });
          //   },
          // ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
                _selectedIndex = index;
                if (index==0) {
                  Navigator.pushNamed(context, '/homescreen');
                } else if(index==1){
                  Navigator.pushNamed(context, '/register');
                }else{
                   Navigator.pushNamed(context, '/register');
                }
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.graduationCap, size: 30),
                title: Text('Learn'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(FontAwesomeIcons.chalkboardTeacher, size: 30),
                  title: Text('Teach'),
                  activeColor: Colors.purpleAccent
              ),
              BottomNavyBarItem(
                  icon: Icon(FontAwesomeIcons.userAlt, size: 30),
                  title: Text('MyProfile'),
                  activeColor: Colors.pink
              ),
            ],
          )
        ),
      ),
    );
  }
}
