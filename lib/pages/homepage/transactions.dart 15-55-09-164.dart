import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  final String listName;
  String co;
  String id;
  int i;
  Lists({
    required this.listName,
    required this.id,
    required this.co,
    required this.i,
  });

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  Color bla = Colors.red;
  Color re = Colors.black;
  bool checkColor = true;
  String text1 = 'Did you do this';

  @override
  Widget build(BuildContext co) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(5),
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
                                        .update({
                                      'Status': 'YES',
                                      'num': widget.i + 1
                                    });
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection('Todos')
                                        .doc(widget.id)
                                        .update({
                                      'Status': 'NO',
                                      'num': widget.i - 1
                                    });
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
      ),
      color: widget.co == 'NO' ? Color.fromARGB(255, 121, 13, 6) : Colors.black,
    );
  }
}
