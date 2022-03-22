import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  final String listName;
  String co;
  String id;
  Lists({
    required this.listName,
    required this.id,
    required this.co,
  });

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  Color bla = Colors.red;
  Color re = Colors.black;
  bool checkColor = true;
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
                                    print(checkColor);

                                    if (checkColor == true) {
                                      FirebaseFirestore.instance
                                          .collection('Todos')
                                          .doc(widget.id)
                                          .update({'Status': 'YES'});
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection('Todos')
                                          .doc(widget.id)
                                          .update({'Status': 'NO'});
                                    }
                                  });
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('YES')),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text('NO'),
                            ),
                          ],
                          title: Text(widget.co == 'NO'
                              ? 'Did you Recover this?'
                              : 'Did you do this'),
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
          color: widget.co == 'NO'
              ? Color.fromARGB(255, 121, 13, 6)
              : Colors.black,
        ));
  }
}
