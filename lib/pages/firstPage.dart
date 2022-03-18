import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  TextEditingController todos = TextEditingController();

  addTask() {
    FirebaseFirestore.instance.collection('Todos').add(
      {'Todos': todos.text},
    );
  }

  onDelete(String Id) {
    FirebaseFirestore.instance.collection('Todos').doc(Id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: todos,
              )),
              TextButton(
                  onPressed: () {
                    addTask();
                  },
                  child: Text('Submit'))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Todos').snapshots(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView(
                        children: snapshot.data!.docs.map((e) {
                      return Dismissible(
                        key: Key(e.id),
                        onDismissed: (Direction) {
                          onDelete(e.id);
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        child: ListTile(
                          title: Text(e['Todos']),
                        ),
                      );
                    }).toList()),
                  );
                }
              })
        ],
      ),
    );
  }
}
