import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view.dart';
import '../hs_viewmodel.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget{

  final HomescreenViewmodel _viewmodel;
   const Bar(HomescreenViewmodel viewmodel) : _viewmodel = viewmodel;

  Size get preferredSize => Size.fromHeight(60.0);

  void _onSearch(){
    
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: TeachscreenViewModel(),
      builder: (context, viewmodel, _) => AppBar(
        title: Text('Teach & Learn'),
        backgroundColor: Color(0xFF00AF19),
        elevation: 3.0,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: () => _onSearch(),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {
              _viewmodel.setUser(null);
              Navigator.pushNamed(context, '/trylogin');
            },
          ),
        ],
      ),
    );
  }
}