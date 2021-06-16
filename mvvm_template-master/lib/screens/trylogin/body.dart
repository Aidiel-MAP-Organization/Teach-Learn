import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/login/login_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();

    if (_user != null){
        print(_user.subject);
        final List<Subject> subject = await viewmodel.getSubject(subjectCode:_user.subject);
        if(subject!= null){
          for(int i=0;i<subject.length;i++){
            _user.setsubjectList(value:subject[i]);
            print('set subject done' + _user.subjectList[i].title);
          }
        }
      // print(_user);
      //   print(subject[0].price);
        Navigator.pushNamed(context, '/homescreen', arguments: _user); 
    }
  }

  void _onRegister(BuildContext context){
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      builder: (context, viewmodel, _) => Container(
      
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('Hello',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  Positioned(
                      top: 50.0,
                      child: Text('There',
                          style:
                              TextStyle(fontFamily: 'Trueno', fontSize: 60.0))),
                  Positioned(
                      top: 97.0,
                      left: 175.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF00AF19))))
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'USERNAME',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00AF19)),
                  )),
              onChanged: (value) => viewmodel.username = value,),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00AF19)),
                  )),
              obscureText: true,
              onChanged: (value) => viewmodel.password = value,),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () => _onLogin(context, viewmodel),
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: Color(0xFF00AF19),
                    elevation: 7.0,
                    child: Center(
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(width: 5.0),
            InkWell(
                onTap: ()  => _onRegister(context),
                child: Text('Register',
                    style: TextStyle(
                        color: Color(0xFF00AF19),
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ])
      )
      );
  }
}