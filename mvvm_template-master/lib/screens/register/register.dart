import 'package:exercise3/screens/register/widget/body.dart';
import 'package:exercise3/screens/register/widget/float.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(state: this),
          floatingActionButton: Float(),
          ),
      ),  
    );
  }
}