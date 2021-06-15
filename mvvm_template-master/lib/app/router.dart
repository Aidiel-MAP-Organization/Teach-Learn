import 'package:exercise3/screens/homescreen/homescreen.dart';
import 'package:exercise3/screens/register/register.dart';
import 'package:exercise3/screens/trylogin/trylogin.dart';
import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    
    case '/':
    case '/main':
      return MainScreen.route();
    
    
    case '/login':
      return LoginScreen.route();
  
    case '/register':
      return RegisterScreen.route();

    
    case '/trylogin':
      return TryLogin.route();
    
    
    case '/homescreen':
      return HomeScreen.route();

  }
  return null;
}
