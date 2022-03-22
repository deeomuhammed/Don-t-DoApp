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
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          Color.fromARGB(255, 1, 67, 75),
          Color.fromARGB(255, 0, 151, 167),
        ]),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: TextButton(
          child: const Text(
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
                      children: const [
                        Text(
                          'Add what not to do',
                          style:
                              TextStyle(color: Color.fromARGB(255, 1, 67, 75)),
                        ),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                    content: TextField(
                      cursorColor: const Color.fromARGB(255, 1, 67, 75),
                      decoration: InputDecoration(
                        hintText: '  Type here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 1, 67, 75),
                              width: 2.0),
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
                        child: const Text('Submit'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 1, 67, 75))),
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
