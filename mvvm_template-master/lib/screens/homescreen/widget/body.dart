import 'package:exercise3/screens/homescreen/hs_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: HomescreenViewmodel(),
      builder: (context, viewmodel, _) => _buildListview(),
    );
  }

    ListView _buildListview() {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.black,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.greenAccent,
        child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(44),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
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
                    'Cats rule the world!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
                style: TextStyle(fontSize: 16),
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
                  onPressed: () {},
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