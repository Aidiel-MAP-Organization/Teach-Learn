import 'package:flutter/material.dart';

import '../teachscreenviewmodel.dart';

class Float extends StatelessWidget {

  final TeachscreenViewModel _viewmodel;
  const Float(TeachscreenViewModel viewmodel) : _viewmodel = viewmodel;

  void _onTap(BuildContext context, TeachscreenViewModel viewmodel){
    print(viewmodel.user.teach);
    Navigator.pushNamed(context, '/editSubject', arguments: viewmodel.user);
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