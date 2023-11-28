// import 'package:flutter/material.dart';
// import 'package:mk_aromatic_limited/constants/core/assets/app_icons.dart';

// import '../constants/global_variables.dart';

// class PrimaryAppbar extends StatelessWidget {
//   const PrimaryAppbar({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 20,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Image.asset(
//                 AppIcons.arrowBack,
//               ),
//             ),
//           ),
//           Text(
//             title,
//             style: const TextStyle(
//                 fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           GlobalVariabels.horizontal10,
//         ],
//       ),
//     );
//   }
// }
