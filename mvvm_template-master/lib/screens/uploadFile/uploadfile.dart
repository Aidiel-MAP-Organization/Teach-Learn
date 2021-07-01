import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/uploadFile/body.dart';
import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view.dart';

class UploadFile extends StatefulWidget {
  
  final String _uploadType, _type;
  final User _user;
  final int _index;
  UploadFile({uploadType, user, index, type}) : _uploadType = uploadType, _user=user, _index=index, _type=type;

  static Route route({uploadType, user, index, type}) =>
      MaterialPageRoute(builder: (context) => UploadFile(uploadType: uploadType, user:user, index:index, type: type));

  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  @override
   Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: UploadViewmodel(),
          builder: (_, mainViewmodel, __){
            mainViewmodel.setUser(widget._user);
            mainViewmodel.index=widget._index;
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
              body: Body(mainViewmodel,widget._uploadType, widget._type),
            );
          }
        ),
      )
    );
  }
}