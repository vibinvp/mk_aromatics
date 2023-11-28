import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

class ChooseScreenOne extends StatefulWidget {
  const ChooseScreenOne({super.key});

  @override
  State<ChooseScreenOne> createState() => _SignInState();
}

class _SignInState extends State<ChooseScreenOne> {
  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: ScreemHight * 0.4,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 95, 39),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 100,
                child: Image.network(
                  "https://play-lh.googleusercontent.com/cECdMzFtaKawPdL7h_YoFbfH3XXiCJPTHlnwb8foVgnYvE6V9lWBfvejETzuHDDW2E0",
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: 230,
            child: Container(
              height: ScreemHight * 0.3,
              width: ScreenWidth * 0.3,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MyButtonGroup(
                  selectedButtonIndex: selectedButtonIndex,
                  onButtonPressed: (index) {
                    setState(() {
                      selectedButtonIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 100,
              child: Image.network(
                "https://play-lh.googleusercontent.com/cECdMzFtaKawPdL7h_YoFbfH3XXiCJPTHlnwb8foVgnYvE6V9lWBfvejETzuHDDW2E0",
              ),
            ),
          ),
          const Positioned(
            bottom: 80,
            left: 50,
            right: 0,
            child: Text(
              "Together, towards a plastic litter free Goa",
              style: TextStyle(
                color: GlobalVariabels.appColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: GlobalVariabels.appColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyButtonGroup extends StatelessWidget {
  final int selectedButtonIndex;
  final Function(int) onButtonPressed;

  MyButtonGroup({required this.selectedButtonIndex, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MyButton(
            index: index,
            selectedIndex: selectedButtonIndex,
            onPressed: onButtonPressed,
          ),
        );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function(int) onPressed;

  MyButton({required this.index, required this.selectedIndex, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          index == selectedIndex ? GlobalVariabels.appColor : Colors.white,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      onPressed: () {
        onPressed(index);
      },
      child: Text("Punchayat", style: TextStyle(
        color: Colors.black,
      ),),
    );
  }
}
