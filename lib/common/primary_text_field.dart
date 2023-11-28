// import 'package:flutter/material.dart';
// import 'package:mk_aromatic_limited/constants/core/style/app_colors.dart';

// class PrimaryTextField extends StatelessWidget {
//   const PrimaryTextField({
//     Key? key,
//     required this.width,
//     required this.hintText,
//     required this.icon,
//     //required this.onChanged,
//     required this.emailcontroller,
//   }) : super(key: key);

//   final double width;
//   final String hintText;

//   final IconData icon;
//   // final Function(String s) onChanged;
//   final TextEditingController emailcontroller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
//       width: width,
//       decoration: BoxDecoration(
//           color: Color.fromARGB(255, 228, 206, 206),
//           borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         children: [
//           SizedBox(height: 20, width: 20, child: Image.asset(icon)),
//           const SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: TextField(
//               controller: emailcontroller,
//               //onChanged: onChanged,
//               style: const TextStyle(color: AppColor.black),
//               decoration: InputDecoration(
//                 hintStyle: const TextStyle(fontSize: 14),
//                 hintText: hintText,
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
