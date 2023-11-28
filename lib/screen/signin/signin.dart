import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_text_field.dart';
import 'package:mk_aromatic_limited/constants/core/assets/app_icons.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      fit: StackFit.passthrough,
      // overflow: Overflow.visible,
      children: <Widget>[
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),

        Container(
          height: ScreemHight*0.4,
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
          top: 230, // Adjusted top value
          child: Container(
          height: ScreemHight*0.4,
            width: ScreenWidth*0.3,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey,
                        )),
                  ),
                  GlobalVariabels.vertical10,
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade100, width: 5.0),
                        ),
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Colors.grey,
                        )),
                  ),
                  GlobalVariabels.vertical15,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 95, 39),
                        ),
                      )
                    ],
                  ),
                  GlobalVariabels.vertical15,
                  SizedBox(
                    width: ScreenWidth*0.3,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 95, 39),
                        )),
                        onPressed: () {},
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  GlobalVariabels.vertical15,
                  GlobalVariabels.vertical10,
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 95, 39)),
                        ),
                      ],
                    ),
                  ),
                ],
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
                "https://play-lh.googleusercontent.com/cECdMzFtaKawPdL7h_YoFbfH3XXiCJPTHlnwb8foVgnYvE6V9lWBfvejETzuHDDW2E0"),
          ),
        ),
     
        const Positioned(
            bottom: 80,
            left: 50,
            right: 0,
            child: Text(
              "Together, towards a plastic litter free Goa",
              style: TextStyle(color: GlobalVariabels.appColor,fontSize: 15,fontWeight: FontWeight.w800),
            )),
        Align(
          
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: GlobalVariabels.appColor),
          ),
        )
        // Container(
        //   height: 300,
        //   width: double.infinity,
        //   color: Colors.amber,
        // ),
        // Positioned(
        //   top: 160,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.red,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey,
        //           blurRadius: 10.0,
        //           spreadRadius: 3.0,
        //           offset: Offset(10.0, 10.0),
        //         ),
        //       ],
        //     ),
        //     alignment: Alignment.centerRight,
        //     width: 200,
        //     height: 200,
        //     child: RotatedBox(
        //       quarterTurns: 1,
        //       child: Text(
        //         'Container 1',
        //         style: TextStyle(fontSize: 18.0, color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}
