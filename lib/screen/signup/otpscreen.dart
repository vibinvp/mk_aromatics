import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:mk_aromatic_limited/screen/signup/signup.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({
    super.key,
  });

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  late RegistrationProvider registrationProvider;

  @override
  void initState() {
    registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    // sendOTPController.changeTimer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //sendOTPController.setTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColoring.kAppBlueColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            welcomeTextRow(),
            otpText(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: form(),
            ),
            const SizedBox(height: 40),
            const SizedBox(height: 30),
            button(),
          ],
        ),
      ),
    );
  }

  Widget welcomeTextRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Verification",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColoring.textDark),
        ),
      ],
    );
  }

  otpText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Add verification code sent on your Email',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColoring.textDark.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          otpTextFormField(),
        ],
      ),
    );
  }

  Widget otpTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 20),
      child: Consumer(
        builder: (context, RegistrationProvider otpContr, child) {
          return Column(
            children: [
              OTPTextField(
                  controller: registrationProvider.otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 40,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 8,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    log('PIN Changed: $pin');
                    otpContr.setPinFromPayment(pin);
                  },
                  onCompleted: (pin) {
                    if (kDebugMode) {
                      print('Completed: $pin');
                    }
                  }),
            ],
          );
        },
      ),
    );
  }

  // Widget timeCountWidget() {
  //   return Consumer4(
  //     builder: (context, SignUpController value, SendOTPController otpContr,
  //         ProfileController profile, ForgotPasswordController forgot, child) {
  //       return Row(
  //         children: [
  //           AppSpacing.ksizedBoxW15,
  //           otpContr.timeRemaining != 0
  //               ? Text(
  //                   '00:${otpContr.timeRemaining}',
  //                   style: const TextStyle(
  //                       fontSize: 20, fontWeight: FontWeight.w500),
  //                 )
  //               : InkWell(
  //                   onTap: () async {
  //                     otpContr.setTimer();
  //                     if (widget.type == ActionTypeOTP.registerOTP) {
  //                       otpContr.sndotp(context,
  //                           refId: value.refferalCodeController.text,
  //                           value: value.mobileController.text);
  //                     } else if (widget.type == ActionTypeOTP.bankDetailsOTP) {
  //                       profile.sndotpUpdateBankDetails(context);
  //                     } else {
  //                       otpContr.sndotpForget(context,
  //                           value: forgot.userNameController.text);
  //                     }
  //                   },
  //                   child: Text(
  //                     'RESEND',
  //                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
  //                           color: Theme.of(context).colorScheme.primary,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                   ),
  //                 )
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer(
        builder: (context, RegistrationProvider value, child) {
          return value.isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(0.0),
                    textStyle: const TextStyle(color: AppColoring.kAppColor),
                  ),
                  onPressed: () {
                    if (value.enteirdOTPController.text.length != 6) {
                      showToast(msg: "Enter OTP", clr: AppColoring.errorPopUp);
                    } else {
                      value.registration(value.selectedSubCatId, context);
                    }
                  },
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: GlobalVariabels.appColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColoring.kAppWhiteColor,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
