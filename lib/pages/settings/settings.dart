import 'package:flutter/material.dart';
import 'package:todoapp/pages/settings/s.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 120),
            Container(
                height: 90,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                      Color.fromARGB(255, 1, 67, 75),
                      Color.fromARGB(255, 0, 151, 167),
                    ])),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png'),
                  backgroundColor: Colors.white,
                  radius: 40,
                )),
            const SizedBox(height: 13.0),
            const Text(
              " Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 73.0),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (() => Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return Se();
                          }))),
                      child: ListTile(
                        trailing: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                        leading: Icon(
                          Icons.person,
                          size: 32,
                          color: Color.fromARGB(255, 1, 67, 75),
                        ),
                        title: Text('My Profile'),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: (() => Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return Se();
                          }))),
                      child: ListTile(
                        trailing: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                        leading: Icon(
                          Icons.chat,
                          size: 32,
                          color: Color.fromARGB(255, 1, 67, 75),
                        ),
                        title: const Text('Contact Us'),
                      ),
                    ),
                  ],
                ))
          ],
        )));
  }
}
