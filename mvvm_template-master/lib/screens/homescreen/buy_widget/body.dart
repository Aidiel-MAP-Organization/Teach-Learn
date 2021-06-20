import 'package:exercise3/models/subject.dart';
import 'package:exercise3/screens/homescreen/buyscreen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
   
  const Body({subject}) : _subject = subject;
  final Subject _subject; 
  
  @override
  Widget build(BuildContext context) {
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
                  child: Text('Buy Cat'),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('Buy Cat Food'),
                  onPressed: () {
                    print('hello');
                  },
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