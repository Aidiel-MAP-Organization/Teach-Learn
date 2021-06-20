import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/homescreen/buyscreen.dart';
import 'package:exercise3/screens/homescreen/homescreen.dart';
import 'package:exercise3/screens/myprofile/myprofile.dart';
import 'package:exercise3/screens/register/register.dart';
import 'package:exercise3/screens/subjectpage/subjectpage.dart';
import 'package:exercise3/screens/teach/editsubject.dart';
import 'package:exercise3/screens/teach/teachscreen.dart';
import 'package:exercise3/screens/trylogin/trylogin.dart';
import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    
    
    case '/main':
      return MainScreen.route();
    
    case '/login':
      return LoginScreen.route();
  
    case '/register':
      return RegisterScreen.route();

    case '/':
    case '/trylogin':
      return TryLogin.route();
     
    case '/homescreen':
      return HomeScreen.route(user: settings.arguments as User);

    case '/teachscreen':
      return TeachScreen.route(user: settings.arguments as User);

    case '/editSubject':
    return EditSubject.route(user: settings.arguments as User);

    
    case '/buyscreen':
      return BuyScreen.route(subject: settings.arguments as Subject);

     
    case '/myprofile':
      return MyProfile.route();

    
    case '/subjectPage':
    return SubjectPage.route();

  }
  return null;
}
