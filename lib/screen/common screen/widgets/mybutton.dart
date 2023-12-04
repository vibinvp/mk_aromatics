import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

class MyButton extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final Function(int) onPressed;

  MyButton({
    required this.index,
    required this.selectedIndex,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          onPressed(index);
        },
        child: Container(
          width: ScreenWidth * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              )
            ],
            color: index == selectedIndex
                ? GlobalVariabels.appColor
                : Colors.white,
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
