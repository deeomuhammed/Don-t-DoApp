import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:todoapp/pages/homepage/transactions.dart%2015-55-09-164.dart';

class TopCard extends StatelessWidget {
//   int status;
//   int? fail;
//   int? success;

//   TopCard({required this.status});

//   @override
//   Widget build(BuildContext context) {
//     print('object');
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Color.fromARGB(255, 0, 151, 167).withOpacity(.6),
//           boxShadow: [
//             BoxShadow(
//                 color: Color.fromARGB(255, 0, 151, 167),
//                 offset: Offset(4, 4),
//                 // blurRadius: 15,
//                 spreadRadius: 1),
//             BoxShadow(
//                 color: Color.fromARGB(255, 0, 151, 167).withOpacity(.6),
//                 offset: Offset(-4, -4),
//                 // blurRadius: 15,
//                 spreadRadius: 1),
//           ],
//         ),
//         child: Center(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Column(children: [
//                     Text(
//                       'Succeeds',
//                       style: TextStyle(
//                           fontFamily: 'rh',
//                           fontSize: 15,
//                           color: Color.fromARGB(255, 255, 255, 255)),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey[200],
//                           ),
//                           child: const Center(
//                             child: Icon(
//                               Icons.arrow_upward,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           '${success}%',
//                           style: TextStyle(
//                               fontFamily: 'rh',
//                               fontSize: 13,
//                               color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ]),
//                 ],
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Column(children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Fails',
//                           style: TextStyle(
//                               fontFamily: 'rh',
//                               fontSize: 15,
//                               color: Color.fromARGB(255, 255, 255, 255)),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           '${status}%',
//                           style: TextStyle(
//                               fontFamily: 'rh',
//                               fontSize: 13,
//                               color: Color.fromARGB(255, 221, 217, 217)),
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey[200],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.arrow_downward,
//                               color: Colors.orange[900],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ]),
//                 ],
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: LinearPercentIndicator(
        barRadius: const Radius.circular(30),
        backgroundColor: const Color.fromARGB(255, 0, 151, 167),
        width: 250,
        animation: true,
        lineHeight: 26.0,
        animationDuration: 3500,
        percent: 0.8,
        center: const Text(
          "80.0%",
          style: TextStyle(color: Colors.white),
        ),
        progressColor: const Color.fromARGB(255, 1, 67, 75),
      ),
    );
  }
}
