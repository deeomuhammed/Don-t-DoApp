import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  int? fail;
  int? success;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[350],
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1),
          ],
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Text(
                      'Succeeds',
                      style: TextStyle(
                          fontFamily: 'rh',
                          fontSize: 15,
                          color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${success}%',
                          style: TextStyle(
                              fontFamily: 'rh',
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Row(
                      children: [
                        Text(
                          'Fails',
                          style: TextStyle(
                              fontFamily: 'rh',
                              fontSize: 15,
                              color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${fail}%',
                          style: TextStyle(
                              fontFamily: 'rh',
                              fontSize: 13,
                              color: Color.fromARGB(255, 121, 13, 6)),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.orange[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
