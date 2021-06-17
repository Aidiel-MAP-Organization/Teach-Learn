import 'package:exercise3/models/subject.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/teach/teachscreenviewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
   final TeachscreenViewModel _viewmodel;
   const Body(TeachscreenViewModel viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {

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

  void _onOkPressed(context, TeachscreenViewModel viewmodel) async{
    

    Subject newSubject = new Subject(
      title: viewmodel.title,
      description: viewmodel.description,
      price: int.parse(viewmodel.price),
      counter: 0,
    );

    print(viewmodel.user.name);
    print(newSubject.price);
    Subject a = await viewmodel.addnewSubject(newSubject);
    viewmodel.user.setTeachCode(a.id);
    print(viewmodel.user.teach[2]);
    User updateUser = await viewmodel.updateUser(viewmodel.user);
    print(updateUser.id);
  }

   void _onCancelPressed(context) => Navigator.pop(context, null);

}