import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../view.dart';

class Body extends StatefulWidget {

  final UploadViewmodel _viewmodel;
  final String _uploadType; 
  const Body(UploadViewmodel viewmodel,uploadType) 
    : _viewmodel = viewmodel, _uploadType = uploadType;
  @override
  _BodyState createState() => _BodyState(_viewmodel,_uploadType);
}

class _BodyState extends State<Body> {

  final UploadViewmodel _viewmodel;
  final String _uploadType; 
  _BodyState(UploadViewmodel viewmodel,uploadType) 
    : _viewmodel = viewmodel,_uploadType = uploadType;
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: UploadViewmodel(),
      builder: (context, _viewmodel, _) => _buildListview(),
    );
  }

  ListView _buildListview() {
      
    if(widget._uploadType=="Videos"){
      if(_viewmodel.user.subjectList[_viewmodel.index].video.length == 1){
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
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black.withOpacity(1),
                width: 1,
              )
            ),
            child: Column(
              children: [
                  
                  Text(
                    'No videos found',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
              ],
            ),
          ),
          ) 
        );
     }
          else{
            return ListView.separated(
          itemCount: _viewmodel.user.subjectList[_viewmodel.index].video.length - 1,
          separatorBuilder: (context, index) => Divider(
            height: 0,
            color: Colors.white,
          ),
          itemBuilder: (context, index) => Container(
            color: Colors.white,
            child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black.withOpacity(1),
                width: 1,
              )
            ),
            child: Column(
              children: [
                  
                  Text(
                    'Video ' + (index+1).toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _viewmodel.user.subjectList[_viewmodel.index].video[index+1],
                    style: TextStyle(fontSize: 20),
                  ),
                
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: Text('Open'),
                      onPressed: () => _openUrl(_viewmodel.user.subjectList[_viewmodel.index].video[index+1]),
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

    else if(widget._uploadType=="Photos"){
      if(_viewmodel.user.subjectList[_viewmodel.index].image.length==1){
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
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black.withOpacity(1),
             width: 1,
          )
        ),
        child: Column(
          children: [
              
              Text(
                'No photos found ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
      ) 
    );
      }
      
      else{
        return ListView.separated(
     // itemCount: 2,
      itemCount: _viewmodel.user.subjectList[_viewmodel.index].image.length - 1,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.white,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black.withOpacity(1),
             width: 1,
          )
        ),
        child: Column(
          children: [
              
              Text(
                'Photo ' + (index+1).toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _viewmodel.user.subjectList[_viewmodel.index].image[index+1],
                style: TextStyle(fontSize: 20),
              ),
            
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Open'),
                  onPressed: () => _openUrl(_viewmodel.user.subjectList[_viewmodel.index].image[index+1]),
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

    else {

      if(_viewmodel.user.subjectList[_viewmodel.index].pdf.length==1){
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
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black.withOpacity(1),
             width: 1,
          )
        ),
        child: Column(
          children: [
              
              Text(
                'No PDF Files found',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
      ) 
    );
      }

      else{
        return ListView.separated(
      itemCount: _viewmodel.user.subjectList[_viewmodel.index].pdf.length - 1,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.white,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black.withOpacity(1),
             width: 1,
          )
        ),
        child: Column(
          children: [
              
              Text(
                'PDF ' + (index+1).toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _viewmodel.user.subjectList[_viewmodel.index].pdf[index+1],
                style: TextStyle(fontSize: 20),
              ),
            
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Open'),
                  onPressed: () => _openUrl(_viewmodel.user.subjectList[_viewmodel.index].pdf[index+1]),
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
    
  }  

  _openUrl(String url){
    launch(url);
  }
}