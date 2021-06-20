import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/homescreen/buy_widget/body.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  final _subject;
  BuyScreen({subject}) : _subject = subject;

  static Route route({subject}) =>
      MaterialPageRoute(builder: (context) => BuyScreen(subject: subject));

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
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xff555555),
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
          body: Body(subject:_subject),
        ),
      ),
    );
  }
}