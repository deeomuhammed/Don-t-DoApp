import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
        ),
      ),
    );
  }
}
