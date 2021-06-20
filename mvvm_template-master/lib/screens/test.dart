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

  void _onDelete(BuildContext context, index, TeachscreenViewModel viewmodel){
    viewmodel.user.teachSubjectList.removeAt(index);
    viewmodel.user._teach.removeAt(index);
    print(viewmodel.user.teach);
  }

  void _onAccess(BuildContext context){
      Navigator.pushNamed(context, '/subjectPage');
  }

  
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: TeachscreenViewModel(),
      builder: (context, _viewmodel, _) => _buildListview(),
    );
  }

    ListView _buildListview() {
    return ListView.separated(
      itemCount: _viewmodel.user.teachSubjectList.length,
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
                    _viewmodel.user.teachSubjectList[index].title,
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
                _viewmodel.user.teachSubjectList[index].description,
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
                  child: Text('Access'),
                  onPressed: () => _onAccess(context),
                ),
                TextButton(
                  child: Text('Delete'),
                  onPressed: () => _onDelete(context,index,_viewmodel),
                )
              ],
            )
          ],
        ),
      ),
      ) 
    );
  }  
}