import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/core/style/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onTap, required this.label});
  final Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.3,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 255, 95, 39),
          )),
          onPressed: onTap,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          )),
    );

    // GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //     height: 50,
    //     width: width,
    //     decoration: BoxDecoration(
    //       color: AppColor.primary,
    //       borderRadius: BorderRadius.circular(8.0),
    //       boxShadow: [
    //         BoxShadow(
    //           color: AppColor.primary.withOpacity(0.4),
    //           offset: const Offset(0, 4),
    //           blurRadius: 08,
    //         )
    //       ],
    //     ),
    //     child: Center(
    //       child: Text(
    //         label,
    //         style: const TextStyle(
    //             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    //       ),
    //     ),
    //   ),
    // );
  }
}
