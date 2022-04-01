// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class TopCard extends StatelessWidget {
//   ValueNotifier<num> sum = ValueNotifier(0);
// ValueNotifier<num> length = ValueNotifier(0);

//   TopCard({required this.sum, required this.length});


//   // double percentage = 0;
//   // double p = 0;

//   pers() {
//     sum.value = sum.value / length.value * 100;
//     // percentage = p * 100;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       child: LinearPercentIndicator(
//         barRadius: const Radius.circular(30),
//         backgroundColor: const Color.fromARGB(255, 0, 151, 167),
//         width: 250,
//         animation: true,
//         lineHeight: 26.0,
//         animationDuration: 3500,
//         percent: 0,
//         center: ValueListenableBuilder(
//             valueListenable: sum,
//             builder: (BuildContext ctx, dynamic value, _) {
//               return Text(
//                 '${value.toString()}%',
//                 style: TextStyle(color: Colors.white),
//               );
//             }),
//         progressColor: const Color.fromARGB(255, 1, 67, 75),
//       ),
//     );
//   }
// }
