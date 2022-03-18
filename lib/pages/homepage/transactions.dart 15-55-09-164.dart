import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  final String listName;

  Lists({
    required this.listName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.black.withOpacity(.8),
        height: 60,
        child: ListTile(
          title: Text(
            listName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'rh',
                fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );
  }
}
