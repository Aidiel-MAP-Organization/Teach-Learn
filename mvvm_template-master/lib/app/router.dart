import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/homescreen/buyscreen.dart';
import 'package:exercise3/screens/homescreen/homescreen.dart';
import 'package:exercise3/screens/myprofile/editmyprofile.dart';
import 'package:exercise3/screens/myprofile/myprofile.dart';
import 'package:exercise3/screens/register/register.dart';
import 'package:exercise3/screens/subjectpage/content_learn_page.dart/contentlearnpage.dart';
import 'package:exercise3/screens/subjectpage/contentpage.dart';
import 'package:exercise3/screens/subjectpage/subjectpage.dart';
import 'package:exercise3/screens/teach/editsubject.dart';
import 'package:exercise3/screens/teach/teachscreen.dart';
import 'package:exercise3/screens/trylogin/trylogin.dart';
import 'package:exercise3/screens/uploadFile/uploadfile.dart';
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
      return BuyScreen.route(subject: settings.arguments[0], user: settings.arguments[1]);
     
    case '/myprofile':
      return MyProfile.route(user: settings.arguments as User);
    

    case '/editMyProfile':
      return EditMyProfile.route(user: settings.arguments as User);
    
    case '/uploadfile':
    return UploadFile.route(uploadType: settings.arguments[0], user: settings.arguments[1], index: settings.arguments[2]);

    
    case '/subjectPage':
    return SubjectPage.route(index: settings.arguments[0], user: settings.arguments[1], type: settings.arguments[2]);

    
    case '/contentPage':
      return ContentPage.route(uploadType: settings.arguments[0], user: settings.arguments[1], index: settings.arguments[2], type: settings.arguments[3]);

    case '/contentLearnPage':
      return ContentLearnPage.route(uploadType: settings.arguments[0], user: settings.arguments[1], index: settings.arguments[2]);

  }
  return null;
}
