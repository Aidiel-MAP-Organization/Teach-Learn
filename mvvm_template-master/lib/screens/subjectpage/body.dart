import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {

    final int _index;
    final User _user;
    final String _type;
    Body({index, user, type})
      : _index = index, _user = user, _type = type;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  

    singleCard(iconcode,icontitle,index){
      return Card(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(iconcode,fontFamily: 'MaterialIcons'),
                color: Colors.black,
                size: 85.0,
              ),
              Text(
                icontitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
              )
            ],
          ),
          onTap: () {
            
            if(widget._type == 'teach'){
              //print(widget._user.teachSubjectList[widget._index].pdf.length);
              print(widget._type);
             Navigator.pushNamed(context, '/contentPage', arguments: [icontitle, widget._user, index, widget._type]);
            }
            else{
              //print("asd");
              Navigator.pushNamed(context, '/contentLearnPage', arguments: [icontitle,widget._user,index]); 
            }
           
          },
        ),
      );
    }
  
  @override

  Widget build(BuildContext context) {
    return View(
      viewmodel: UploadViewmodel(),
      builder: (context, viewmodel, _) => GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            singleCard(61079,'Videos',widget._index),
            singleCard(61079,'Photos',widget._index),
            singleCard(61079,'Notes',widget._index),
          ],
      )
    );
    
  }
}