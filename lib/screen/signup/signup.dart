import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';

import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen1.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUPState();
}

bool _passwordVisible = false;
late RegistrationProvider registrationProvider;

class _SignUPState extends State<SignUp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    registrationProvider.getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registrationProvider.getcategoryList(context);
    });
  }

  bool _passwordVisible = false;
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
                  "Sign Up",
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
                    height: ScreemHight * 0.44,
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
                            controller: registrationProvider.usernameController,
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
                                hintText: 'Name',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          TextField(
                            controller: registrationProvider.mobileController,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                hintText: 'Mobile Number',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          TextField(
                            controller: registrationProvider.emailController,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                hintText: 'Email',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          TextField(
                            controller: registrationProvider.passwordController,
                            obscureText: !_passwordVisible,
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
                            controller:
                                registrationProvider.confirmpasswordController,
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
                          Consumer(builder:
                              (context, RegistrationProvider value, _) {
                            return SizedBox(
                              width: ScreenWidth * 0.3,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 255, 95, 39),
                                  )),
                                  onPressed: () {
                                    if (value.emailController.text == '' ||
                                        value.emailController.text.isEmpty ||
                                        value.usernameController.text == '' ||
                                        value.usernameController.text.isEmpty ||
                                        value.passwordController.text == '' ||
                                        value.passwordController.text.isEmpty ||
                                        value.confirmpasswordController.text ==
                                            '' ||
                                        value.confirmpasswordController.text
                                            .isEmpty) {
                                      showToast(
                                          msg: 'Enter the all fields correctly',
                                          clr: AppColoring.errorPopUp);
                                    } else if (value
                                            .mobileController.text.length !=
                                        10) {
                                      showToast(
                                          msg: 'Enter 10 digit mobile number ',
                                          clr: AppColoring.errorPopUp);
                                    } else if (!isValidEmail(
                                        value.emailController.text)) {
                                      showToast(
                                        msg: 'Enter a valid email address',
                                        clr: AppColoring.errorPopUp,
                                      );
                                    } else if (value.passwordController.text !=
                                        value.confirmpasswordController.text) {
                                      showToast(
                                          msg:
                                              'The Confirm Password field does not match the Password field.',
                                          clr: AppColoring.errorPopUp);
                                    } else {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ChooseScreenOne();
                                      }));
                                    }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            );
                          }),
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

  bool isValidEmail(String email) {
    // Regular expression for basic email validation
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
