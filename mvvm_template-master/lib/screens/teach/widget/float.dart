import 'package:flutter/material.dart';

import '../teachscreenviewmodel.dart';

class Float extends StatelessWidget {

  final TeachscreenViewModel _viewmodel;
  const Float(TeachscreenViewModel viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () {},
        ),
      ],
    );
  }
}