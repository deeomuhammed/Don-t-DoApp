import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Se extends StatelessWidget {
  const Se({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 67, 75),
        elevation: 0,
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Card(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          return mail();
                        },
                        child: ListTile(
                          title: Text(
                            'deeomuhammed5@gmail.com',
                            style: TextStyle(fontFamily: 'ub'),
                          ),
                          leading: Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => whatsapp(),
                        child: ListTile(
                          leading: Icon(Icons.whatsapp),
                          title: Text(
                            '7994968692',
                            style: TextStyle(fontFamily: 'ub'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          'About Developer',
                          style: TextStyle(fontFamily: 'ub'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {
                    return whatsapp();
                  }),
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 35,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    return instagram();
                  },
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    size: 34,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    return mail();
                  },
                  child: Icon(
                    Icons.mail_outline,
                    size: 38,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    return telegram();
                  },
                  child: Icon(
                    FontAwesomeIcons.telegramPlane,
                    size: 36,
                    color: Colors.teal[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  instagram() async {
    await launch('https://www.instagram.com/deeo.in/');
  }

  whatsapp() async {
    await launch('https://wa.me/+917994968692');
  }

  telegram() async {
    await launch('https://telegram.me/deeomuhammed');
  }

  mail() async {
    await launch('mailto:domuhammed5@gmail.com');
  }
}
