import 'package:flutter/material.dart';
import 'package:todoapp/pages/homepage/homepage.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddThings(),
      ),
    );
  }
}
