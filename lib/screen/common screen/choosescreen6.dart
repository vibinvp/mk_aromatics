import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';
import 'package:mk_aromatic_limited/screen/home/homescreen.dart';

class ChooseScreen6 extends StatefulWidget {
  const ChooseScreen6({super.key});

  @override
  State<ChooseScreen6> createState() => _ChooseScreen6();
}

class _ChooseScreen6 extends State<ChooseScreen6> {
  int selectedButtonIndex = -1; // Maintain the selected button index
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LandingScreen()),
          );
        },
        child: Stack(
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
                child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical10,
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Thank",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: ' You',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 255, 95, 39)),
                              ),
                            ],
                          ),
                        ),
                        GlobalVariabels.vertical10,
                        CircleAvatar(
                          maxRadius: 35,
                          backgroundColor: GlobalVariabels.appColor,
                          child: SizedBox(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 39,
                            ),
                          ),
                        ),
                        GlobalVariabels.vertical15,
                        Text(
                          "Verified",
                          style: TextStyle(color: Colors.grey),
                        )
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
      ),
    );
  }
}
