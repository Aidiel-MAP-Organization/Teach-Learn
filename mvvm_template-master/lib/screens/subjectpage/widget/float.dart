import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:flutter/material.dart';


class Float extends StatelessWidget {

  final UploadViewmodel _viewmodel;
  final String _uploadType; 
  const Float(UploadViewmodel viewmodel,uploadType) : _viewmodel = viewmodel, _uploadType = uploadType;

  void _onTap(BuildContext context, UploadViewmodel viewmodel){
    Navigator.pushNamed(context, '/uploadfile', arguments: [_uploadType,_viewmodel.user,_viewmodel.index]);
  }

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () => _onTap(context, _viewmodel),
        ),
      ],
    );
  }
}