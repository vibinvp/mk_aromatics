import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen6.dart';

class ChooseScreen5 extends StatefulWidget {
  const ChooseScreen5({super.key});

  @override
  State<ChooseScreen5> createState() => _ChooseScreen5();
}

class _ChooseScreen5 extends State<ChooseScreen5> {
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
              "Welcome",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: 230,
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
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: GlobalVariabels.appColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Jhon Deo",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Vasco-Mormugao",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      const Text(
                        "In the above image Container 1 is not wrapped inside a Positioned widget, whereas Container 2 and 3 are, so when stackFit.expand is used Container 1 expands to the width and the height of the parent.",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      SizedBox(
                        width: ScreenWidth * 0.3,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 255, 95, 39),
                            )),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ChooseScreen6();
                              }));
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )),
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
