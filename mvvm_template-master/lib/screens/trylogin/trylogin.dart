import 'package:exercise3/screens/trylogin/body.dart';
import 'package:flutter/material.dart';

class TryLogin extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TryLogin());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(),
        ),
      ),
    );
  }
}