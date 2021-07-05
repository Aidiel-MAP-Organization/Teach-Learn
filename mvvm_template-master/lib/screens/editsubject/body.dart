import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/myprofile/myprofile_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final MyProfileViewModel _viewmodel;
  final int _index;
  const Body({MyProfileViewModel viewmodel, index})
      : _viewmodel = viewmodel,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTextLisTile(
            label: 'Course Title',
            value: _viewmodel.user.teachSubjectList[_index].title,
            onChanged: (value) => _viewmodel.username = value),
        _buildTextLisTile(
            label: 'Course Description',
            value: _viewmodel.user.teachSubjectList[_index].description,
            onChanged: (value) => _viewmodel.name = value),
        _buildTextLisTile(
            label: 'Price',
            value: _viewmodel.user.teachSubjectList[_index].price.toString(),
            onChanged: (value) => _viewmodel.password = value),
        _buildButtons(context)
      ],
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

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () => onPressedOk(context),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
        ),
      ],
    );
  }

  void onPressedOk(context) async {
    _viewmodel.updateUser();
    Navigator.pushNamed(context, '/homescreen', arguments: _viewmodel.user);
  }
}
