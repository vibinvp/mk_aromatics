import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/forgot%20password/forgotpassword_controller.dart';
import 'package:mk_aromatic_limited/screen/signin/forgot%20password/new_password.dart';
import 'package:provider/provider.dart';

class VerificationField extends StatefulWidget {
  const VerificationField({super.key});

  @override
  State<VerificationField> createState() => _VerificationFieldState();
}

late ForgotPasswordController forgotPasswordController;

class _VerificationFieldState extends State<VerificationField> {
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
                  "Verification ",
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
                            controller: forgotPasswordController.otpController,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              hintText: 'Enter Your OTP',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                          GlobalVariabels.vertical15,
                          GlobalVariabels.vertical10,
                          SizedBox(
                            width: ScreenWidth * 0.3,
                            child: Consumer(builder:
                                (context, ForgotPasswordController value, _) {
                              return value.isLoadSndOtp
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
                                        if (value.otpController.text.length !=
                                            6) {
                                          showToast(
                                              msg: "Enter OTP",
                                              clr: AppColoring.errorPopUp);
                                        } else {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return NewPasswordField();
                                          }));
                                        }
                                      },
                                      child: const Text(
                                        "Verify",
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
