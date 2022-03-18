import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/pages/homepage/plusbutton.dart';
import 'package:todoapp/pages/homepage/topcard.dart';
import 'package:todoapp/pages/homepage/transactions.dart%2015-55-09-164.dart';

class AddThings extends StatelessWidget {
  const AddThings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 226, 226),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.settings)],
              ),
              SizedBox(
                height: 2,
              ),
              Text('Don\'t  do  ',
                  style: TextStyle(
                      fontFamily: 'rh', fontSize: 30, color: Colors.black)),
              SizedBox(
                height: 9,
              ),
              TopCard(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Todos')
                        .snapshots(),
                    builder: (ctx, Snapshot) {
                      if (!Snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView(
                          children: Snapshot.data!.docs.map((e) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Slidable(
                                startActionPane: ActionPane(
                                    motion: DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) {
                                                return AlertDialog(
                                                  title: Text(
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
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: Text('yes')),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .black)),
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: Text('No'),
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        backgroundColor:
                                            Color.fromARGB(255, 228, 226, 226),
                                        foregroundColor:
                                            Color.fromARGB(255, 238, 19, 4),
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ]),
                                key: Key(e.id),
                                child: Lists(
                                  listName: e['TodosList'],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    }),
              ),
              SizedBox(
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
