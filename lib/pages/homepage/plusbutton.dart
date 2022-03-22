import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  PlusButton({Key? key}) : super(key: key);

  TextEditingController dontdo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: TextButton(
          child: Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add what not to do'),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                    content: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: '  Type here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      controller: dontdo,
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (dontdo.text.isNotEmpty) {
                            FirebaseFirestore.instance.collection('Todos').add(
                              {
                                'TodosList': dontdo.text,
                                'Status': 'YES',
                                'num': 1
                              },
                            );
                          }

                          dontdo.clear();
                          Navigator.pop(context);
                        },
                        child: Text('Submit'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
