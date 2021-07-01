import 'dart:io';

import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/uploadFile/firebase_api.dart';
import 'package:exercise3/screens/uploadFile/uploadviewmodel.dart';
import 'package:exercise3/screens/uploadFile/widget/button_widget.dart';
import 'package:exercise3/screens/view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

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

  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';

      return View(
        viewmodel: UploadViewmodel(),
        builder: (context, viewmodel, _) => Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task) : Container(),
            ],
          ),
        ),
      )
      );
    
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;
    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    // print(urlDownload);
    if(_uploadType=="Photos"){
      _viewmodel.user.teachSubjectList[_viewmodel.index].setimage(urlDownload);
      _viewmodel.updateSubject(_viewmodel.user.teachSubjectList[_viewmodel.index]);
    }
    else if(_uploadType=='Notes'){
      _viewmodel.user.teachSubjectList[_viewmodel.index].setpdf(urlDownload);
      _viewmodel.updateSubject(_viewmodel.user.teachSubjectList[_viewmodel.index]);
      setState(() {});
    }
    else if(_uploadType=='Videos'){
      _viewmodel.user.teachSubjectList[_viewmodel.index].setvideo(urlDownload);
      _viewmodel.updateSubject(_viewmodel.user.teachSubjectList[_viewmodel.index]);
      setState(() {});
    }
    Navigator.pushNamed(this.context, '/subjectPage', arguments: [_viewmodel.index,_viewmodel.user]);
    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

