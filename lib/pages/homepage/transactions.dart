import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/homepage/homepage.dart';

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
  bool checkColor = true;
  String text1 = 'Did you do this';

  @override
  Widget build(BuildContext co) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          trailing: IconButton(
              icon: const Icon(
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
                                const Color.fromARGB(255, 1, 67, 75),
                              )),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                setState(() {
                                  checkColor = !checkColor;
                                  if (checkColor == true) {
                                    FirebaseFirestore.instance
                                        .collection('Todos')
                                        .doc(widget.id)
                                        .update({
                                      'Status': 'YES',
                                      'num': 1,
                                    });
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection('Todos')
                                        .doc(widget.id)
                                        .update({
                                      'Status': 'NO',
                                      'num': 0,
                                    });
                                  }
                                });
                              },
                              child: const Text('YES')),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 1, 67, 75),
                            )),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('NO'),
                          ),
                        ],
                        title: Text(
                          widget.co == 'NO'
                              ? 'Did you Recover this?'
                              : 'Did you do this',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 1, 67, 75),
                          ),
                        ),
                      );
                    });
              }),
          title: Text(
            widget.listName.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'rh',
                fontWeight: FontWeight.w100),
          ),
        ),
      ),
      color: widget.co == 'NO'
          ? const Color.fromARGB(255, 1, 67, 75)
          : const Color.fromARGB(255, 0, 151, 167),
    );
  }
}
