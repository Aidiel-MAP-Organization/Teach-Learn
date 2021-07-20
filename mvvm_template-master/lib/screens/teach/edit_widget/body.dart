import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final TeachscreenViewModel _viewmodel;
  const Body(TeachscreenViewModel viewmodel) : _viewmodel = viewmodel;

  @override
  _BodyState createState() => _BodyState(_viewmodel);
}

class _BodyState extends State<Body> {

  final TeachscreenViewModel _viewmodel;

  _BodyState(TeachscreenViewModel viewmodel) : _viewmodel = viewmodel;

  void _onOkPressed(context, TeachscreenViewModel viewmodel) async{    
    getUpdateUser(viewmodel);
    Navigator.pushNamed(context, '/teachscreen', arguments: viewmodel.user);    
  }

  void getUpdateUser(TeachscreenViewModel viewmodel) async{
    Subject a = await viewmodel.addnewSubject();
      viewmodel.user.setTeachCode(a.id);
      viewmodel.user.insertNewTeachSubject(a);
    User updateUser = await viewmodel.updateUser(viewmodel.user);
    viewmodel.setUser(updateUser);
  }

   void _onCancelPressed(context) => Navigator.pop(context, null);

  @override
  Widget build(BuildContext _context) {

    return View(
      viewmodel: TeachscreenViewModel(),
      builder: (context, viewmodel, _) => ListView(
        children: [
          _buildTextLisTile(
              label: 'Title',
              value: 'Course Title',
              onChanged: (value) => _viewmodel.title = value,
          ),
          _buildTextLisTile(
              label: 'Description',
              value: 'Course Description',
              onChanged: (value) => _viewmodel.description = value,
          ),
          
          _buildTextLisTile(
              label: 'Price',
              value: '0',
              onChanged: (value) => _viewmodel.price = value,
          ),
          
          _buildButtons(context,_viewmodel)
        ],
      )
    );
    
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context, TeachscreenViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () => _onOkPressed(context,viewmodel),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => _onCancelPressed(context),
        ),
      ],
    );
  }
}