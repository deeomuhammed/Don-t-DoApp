import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:todoapp/pages/homepage/plusbutton.dart';

import 'package:todoapp/pages/homepage/transactions.dart';
import 'package:todoapp/pages/settings/settings.dart';

class AddThings extends StatefulWidget {
  const AddThings({Key? key}) : super(key: key);

  @override
  State<AddThings> createState() => _AddThingsState();
}

class _AddThingsState extends State<AddThings> {
  num number = 0;
  int length = 0;
  @override
  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> h = ValueNotifier(0);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 172, 193).withOpacity(.2),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 2,
              ),
              const logotext(),
              const SizedBox(
                height: 9,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Todos')
                        .snapshots(),
                    builder: (ctx, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        number = 0;

                        return ListView(
                          children: snapshot.data!.docs.map((e) {
                            //adding
                            number += e['num'];
                            length = snapshot.data!.docs.length;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Slidable(
                                  startActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            // print(numb);
                                            showDialog(
                                                context: context,
                                                builder: (ct) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Do you want to Delete this? '),
                                                    actions: [
                                                      ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .black)),
                                                          onPressed: () {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Todos')
                                                                .doc(e.id)
                                                                .delete();
                                                            Navigator.of(ct)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'yes')),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .black)),
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          backgroundColor: Colors.transparent,
                                          foregroundColor: const Color.fromARGB(
                                              255, 238, 19, 4),
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ]),
                                  key: Key(e.id),
                                  child: Lists(
                                    i: e['num'],
                                    co: e['Status'],
                                    id: e.id,
                                    listName: e['TodosList'],
                                  )),
                            );
                          }).toList(),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              PlusButton()
            ],
          ),
        ),
      ),
    );
  }
}

class logotext extends StatelessWidget {
  const logotext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Don\'t Do',
        style: TextStyle(
          fontFamily: 'rh',
          fontSize: 30,
          color: Color.fromARGB(255, 1, 67, 75),
        ));
  }
}

class settings extends StatelessWidget {
  const settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return Setting();
            }));
          },
          icon: const Icon(
            Icons.settings,
            color: Color.fromARGB(255, 1, 67, 75),
          ),
        )
      ],
    );
  }
}
