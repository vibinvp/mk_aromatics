import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen2.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen3.dart';

class ChooseScreenOne extends StatefulWidget {
  const ChooseScreenOne({super.key});

  @override
  State<ChooseScreenOne> createState() => _SignInState();
}

class _SignInState extends State<ChooseScreenOne> {
  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index
  final demi = ["Urban Local Bodies", "Others"];

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
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Center(
                child: Text(
              "Choose",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: ScreemHight * 0.34,
            child: Container(
              height: ScreemHight * 0.28,
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MyButtonGroup(
                    selectedButtonIndex: selectedButtonIndex,
                    onButtonPressed: (index) {
                      setState(() {
                        selectedButtonIndex = index;
                        if (selectedButtonIndex == 0) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const ChooseScreen2();
                          }));
                        } else {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const ChooseScreen3();
                          }));
                        }
                      });
                    },
                    demi: demi,
                    title: " ",
                  ),
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
  final List<String> demi;

  const MyButtonGroup({
    Key? key,
    required this.selectedButtonIndex,
    required this.onButtonPressed,
    required this.demi,
    required String title,
  }) : super(key: key);

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
          width: ScreenWidth * 0.7,
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
