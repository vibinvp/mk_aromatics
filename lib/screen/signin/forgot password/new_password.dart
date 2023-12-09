import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/forgot%20password/forgotpassword_controller.dart';
import 'package:mk_aromatic_limited/screen/signin/forgot%20password/verification.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';
import 'package:provider/provider.dart';

class NewPasswordField extends StatefulWidget {
  NewPasswordField({super.key});

  @override
  State<NewPasswordField> createState() => _NewPasswordFieldState();
}

bool _passwordVisible = false;

class _NewPasswordFieldState extends State<NewPasswordField> {
  late ForgotPasswordController forgotPasswordController;
  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPasswordController =
        Provider.of<ForgotPasswordController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.passthrough,
            // overflow: Overflow.visible,
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
                  "Create New Password ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: ScreemHight * 0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    // height: ScreemHight * 0.44,
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
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: !_passwordVisible,
                            controller:
                                forgotPasswordController.passwordController,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.grey), // Change the color here
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey.shade400,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          TextField(
                            controller: forgotPasswordController
                                .confirmpPasswordController,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.grey), // Change the color here
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                hintText: 'Confirm Password',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          GlobalVariabels.vertical15,
                          GlobalVariabels.vertical10,
                          SizedBox(
                            width: ScreenWidth * 0.3,
                            child: Consumer(builder:
                                (context, ForgotPasswordController value, _) {
                              return value.islodingforgot
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 255, 95, 39),
                                      )),
                                      onPressed: () {
                                        if (forgotPasswordController
                                                .passwordController.text
                                                .trim()
                                                .isEmpty ||
                                            forgotPasswordController
                                                .confirmpPasswordController.text
                                                .trim()
                                                .isEmpty) {
                                          showToast(
                                              msg: "Enter your fields ",
                                              clr: AppColoring.errorPopUp);
                                        } else if (value
                                                .passwordController.text !=
                                            value.confirmpPasswordController
                                                .text) {
                                          showToast(
                                              msg:
                                                  'The Confirm Password field does not match the Password field.',
                                              clr: AppColoring.errorPopUp);
                                        } else {
                                          value.forgotpassword(context);
                                        }
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ));
                            }),
                          ),
                          GlobalVariabels.vertical15,
                          GlobalVariabels.vertical10,
                        ],
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
          )),
    );
  }
}
