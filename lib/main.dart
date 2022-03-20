import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:todoapp/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      title: 'Don\'t do',
      home: Splash(),
    );
  }
}
