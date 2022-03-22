import 'dart:async';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const MyHomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  FontAwesomeIcons.quoteLeft,
                  size: 30.0,
                  color: Colors.grey,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "If you do not do something, maybe you will not succeed, but you will not lose",
                style: TextStyle(
                    color: Color.fromARGB(255, 44, 44, 44),
                    fontFamily: 'rh',
                    fontSize: 40)),
            const SizedBox(height: 10.0),
            Text(
              "Deeo",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
