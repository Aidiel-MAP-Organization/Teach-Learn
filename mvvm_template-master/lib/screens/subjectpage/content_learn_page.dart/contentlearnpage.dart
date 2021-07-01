import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/subjectpage/content_learn_page.dart/body.dart';
import 'package:exercise3/screens/subjectpage/widget/float.dart';
import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class ContentLearnPage extends StatefulWidget {
  final String _uploadType, _type;
  final User _user;
  final int _index;
  ContentLearnPage({uploadType, user, index, type}) : _uploadType = uploadType, _user=user, _index=index, _type=type;

  static Route route({uploadType, user, index}) =>
      MaterialPageRoute(builder: (context) => ContentLearnPage(uploadType: uploadType, user:user, index:index));

  @override
  _ContentLearnPageState createState() => _ContentLearnPageState();
}

class _ContentLearnPageState extends State<ContentLearnPage> {
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
              body: Body(mainViewmodel,widget._uploadType),
              //floatingActionButton: Float(mainViewmodel,widget._uploadType,widget._type),
            );
          }
        ),
      )
    );
  }
}