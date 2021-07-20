import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/homescreen/buy_widget/body.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'hs_viewmodel.dart';

class BuyScreen extends StatefulWidget {
  final _subject;
  final _user;
  BuyScreen({subject, user}) : _subject = subject, _user=user;

  static Route route({subject, user}) =>
      MaterialPageRoute(builder: (context) => BuyScreen(subject: subject, user:user));

  @override
  _BuyScreenState createState() => _BuyScreenState(subject: _subject);
}

class _BuyScreenState extends State<BuyScreen> {

  _BuyScreenState({subject}) : _subject = subject;

  Subject _subject;

  get subject => _subject;

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
              
              body: Body(mainViewmodel,_subject),
            );
          }
        ),
      )
    );
  }
}