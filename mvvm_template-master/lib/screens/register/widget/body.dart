import 'package:exercise3/screens/register/register.dart';
import 'package:exercise3/screens/register/register_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  
  const Body({state}) : _state = state;

  final RegisterScreen _state;

  void _onSignUp(BuildContext context, RegisterViewmodel viewmodel) async{
    final String message = await viewmodel.register();
    
    if(message=='success'){
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: RegisterViewmodel(),
      builder: (context, viewmodel, _) => Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('Signup',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  //Dot placement
                  Positioned(
                      top: 62.0,
                      left: 200.0,
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
              onChanged: (value)  => viewmodel.username = value,),

          TextFormField(
              decoration: InputDecoration(
                  labelText: 'NAME',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00AF19)),
                  )),
              onChanged: (value) => viewmodel.name = value,),

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
            onTap: () => _onSignUp(context, viewmodel),
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: Color(0xFF00AF19),
                    elevation: 7.0,
                    child: Center(
                        child: Text('SIGN UP',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back',
                    style: TextStyle(
                        color: Color(0xFF00AF19),
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ],
      ),
      )

    );
  }
}