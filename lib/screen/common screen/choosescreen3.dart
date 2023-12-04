import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen4.dart';

class ChooseScreen3 extends StatefulWidget {
  const ChooseScreen3({super.key});

  @override
  State<ChooseScreen3> createState() => _ChooseScreen3();
}

class _ChooseScreen3 extends State<ChooseScreen3> {
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
            child: const Center(
                child: Text(
              "Others",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: ScreemHight * 0.33,
            child: Container(
              height: ScreemHight * 0.4,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: MyButtonGroup(
                  selectedButtonIndex: selectedButtonIndex,
                  onButtonPressed: (index) {
                    setState(() {
                      selectedButtonIndex = index;
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ChooseScreen4();
                      }));
                    });
                  },
                ),
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

  MyButtonGroup(
      {super.key,
      required this.selectedButtonIndex,
      required this.onButtonPressed});

  final demi = ["NGO", "School", "Industry", "Restaurant", "Hotel"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demi.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MyButton(
            index: index,
            selectedIndex: selectedButtonIndex,
            onPressed: onButtonPressed,
            title: demi[index],
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
  final String title;

  MyButton(
      {required this.index,
      required this.selectedIndex,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          index == selectedIndex
              ? GlobalVariabels.appColor
              : Colors.grey.shade300,
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
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
