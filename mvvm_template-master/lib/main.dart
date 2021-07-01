import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/dependencies.dart' as di;
import 'app/router.dart';

Future main() async{
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'MVVM Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,
      backgroundColor: Colors.greenAccent),
      initialRoute: '/',
      onGenerateRoute: createRoute,
    ),
  );
}
