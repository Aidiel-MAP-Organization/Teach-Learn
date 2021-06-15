import 'package:exercise3/screens/login/login_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      builder: (context, viewmodel, _) => AppBar(
        title: Text('Teach & Learn'),
        backgroundColor: Color(0xFF00AF19),
        elevation: 3.0,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}