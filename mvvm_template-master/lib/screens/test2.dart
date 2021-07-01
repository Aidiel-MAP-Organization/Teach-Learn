import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

import 'homescreen/hs_viewmodel.dart';

class Body extends StatefulWidget {
  final HomescreenViewmodel _viewmodel;
  final Subject _subject; 
  const Body(HomescreenViewmodel viewmodel,subject) 
    : _viewmodel = viewmodel,_subject = subject;

  @override
  _BodyState createState() => _BodyState(_viewmodel,_subject);
}

class _BodyState extends State<Body> {

  final HomescreenViewmodel _viewmodel;
  final Subject _subject; 
  _BodyState(HomescreenViewmodel viewmodel,subject) 
    : _viewmodel = viewmodel,_subject = subject;

  void _onBuy(HomescreenViewmodel _viewmodel,Subject subject){
    print(subject.title);
    
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: HomescreenViewmodel(),
      builder: (context, _viewmodel, _) => _buildListview(),
    );
  }

    ListView _buildListview() {
    return ListView.separated(
      itemCount: 1,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.white,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(44),
          side: BorderSide(
            color: Colors.black.withOpacity(1),
             width: 1,
          )
        ),
        child: Column(
          children: [
            Stack(
               children: [
                Ink.image(
                  image: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                  height: 150,
                  fit: BoxFit.cover,
                ),
                // Icon(
                //   FontAwesomeIcons.android,
                // ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    _subject.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                _subject.description,
                style: TextStyle(fontSize: 20),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Buy Course'),
                  onPressed: () => _onBuy(_viewmodel,_subject),
                ),
              ],
            )
          ],
        ),
      ),
      ) 
    );
  }
}