import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view.dart';
import '../hs_viewmodel.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {

  final HomescreenViewmodel _viewmodel;
  const Bar(HomescreenViewmodel viewmodel) : _viewmodel = viewmodel;
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  _BarState createState() => _BarState(_viewmodel);
}

class _BarState extends State<Bar> {

  final HomescreenViewmodel _viewmodel;
  _BarState(HomescreenViewmodel viewmodel) : _viewmodel = viewmodel;

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Teach & Learn");
  Widget logoutIcon = Icon(FontAwesomeIcons.signOutAlt);

  void _onsearch(BuildContext context, HomescreenViewmodel viewmodel)async{
    print(viewmodel.user.name);
    Subject searchSubject = await viewmodel.getSubject(viewmodel.search);
    Navigator.pushNamed(context, '/buyscreen', arguments: [searchSubject,viewmodel.user]);
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: HomescreenViewmodel(),
      builder: (context, viewmodel, _) => AppBar(
        title: cusSearchBar,
        backgroundColor: Color(0xFF00AF19),
        elevation: 3.0,
        actions: [
          IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if(this.cusIcon.icon == Icons.search){
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      hintText: "Search Course Name",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    onChanged: (value) => {_viewmodel.search = value},
                  );
                  this.logoutIcon = IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _onsearch(context, _viewmodel),
                  );
                }else{
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Teach & Learn");
                  this.logoutIcon = IconButton(
                    icon: Icon(FontAwesomeIcons.signOutAlt),
                    onPressed: () {
                      _viewmodel.setUser(null);
                      Navigator.pushNamed(context, '/trylogin');
                    },
                  );
                }
              });
            },
          ),
          IconButton(
            icon: logoutIcon,
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