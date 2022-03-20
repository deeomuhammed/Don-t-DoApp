import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  final String listName;

  Lists({
    required this.listName,
  });

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  bool checkColor = true;
  Color color = Colors.black;
  String text1 = 'Did you do this';
  int percentage = 0;
  @override
  Widget build(BuildContext co) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: 60,
          child: ListTile(
            trailing: IconButton(
                icon: Icon(
                  FontAwesomeIcons.question,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 0, 0, 0))),
                                onPressed: () {
                                  setState(() {
                                    checkColor = !checkColor;
                                    if (checkColor == true) {
                                      color = Colors.black;
                                      text1 = 'Did you do this';
                                    } else {
                                      text1 = 'Did you Recover this?';
                                      color = Color.fromARGB(255, 121, 13, 6);
                                    }
                                  });
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('yes')),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text('No'),
                            ),
                          ],
                          title: Text(text1),
                        );
                      });
                }),
            title: Text(
              widget.listName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'rh',
                  fontWeight: FontWeight.w100),
            ),
          ),
          color: color,
        ));
  }
}
