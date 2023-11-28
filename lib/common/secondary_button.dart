import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/core/style/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.onTap, required this.label});
  final Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffCFF6F3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: AppColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
