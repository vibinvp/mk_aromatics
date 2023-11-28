import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_text_field.dart';
import 'package:mk_aromatic_limited/constants/core/assets/app_icons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          height: 250,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 95, 39),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
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
          left: 50,
          right: 50,
          top: 220, // Adjusted top value
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
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
