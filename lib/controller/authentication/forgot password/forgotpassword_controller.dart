import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/model/registration/message_response_model.dart';
import 'package:mk_aromatic_limited/screen/signin/forgot%20password/verification.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';
import 'package:mk_aromatic_limited/screen/signup/otpscreen.dart';

class ForgotPasswordController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpPasswordController = TextEditingController();
  MessageModel? model;
  bool isLoadSndOtp = false;
  Future<bool> forgotpasswordotp(
    BuildContext context,
  ) async {
    bool check = false;
    notifyListeners();
    try {
      isLoadSndOtp = true;
      notifyListeners();

      var paremeters = {'email': emailController.text};

      await ApiBaseHelper.postAPICall(ApiEndPoint.forgetpassword, paremeters)
          .then((value) {
        model = MessageModel.fromJson(value);
        if (model != null) {
          if (model!.status == true) {
            showToast(msg: model!.message ?? '', clr: AppColoring.successPopup);

            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const VerificationField();
            }));
            check = true;
            notifyListeners();
            isLoadSndOtp = false;
            notifyListeners();
          } else {
            showToast(msg: model!.message ?? '', clr: AppColoring.errorPopUp);
            isLoadSndOtp = false;
            notifyListeners();
          }
        } else {
          isLoadSndOtp = false;
          notifyListeners();
        }
      });
    } catch (e) {
      print(e);
      isLoadSndOtp = false;
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
    return check;
  }
  //

  bool islodingforgot = false;
  Future<bool> forgotpassword(
    BuildContext context,
  ) async {
    bool check = false;
    notifyListeners();
    try {
      islodingforgot = true;
      notifyListeners();

      var paremeters = {
        'email': emailController.text,
        'otp': otpController.text,
        'password': passwordController.text
      };

      await ApiBaseHelper.postAPICall(ApiEndPoint.forgetpassword, paremeters)
          .then((value) {
        model = MessageModel.fromJson(value);
        if (model != null) {
          if (model!.status == true) {
            showToast(msg: model!.message ?? '', clr: AppColoring.successPopup);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return const SignIn();
            }), (route) => false);
            emailController.clear();
            otpController.clear();
            passwordController.clear();
            confirmpPasswordController.clear();
            check = true;
            notifyListeners();
            islodingforgot = false;
            notifyListeners();
          } else {
            showToast(msg: model!.message ?? '', clr: AppColoring.errorPopUp);
            islodingforgot = false;
            notifyListeners();
          }
        } else {
          islodingforgot = false;
          notifyListeners();
        }
      });
    } catch (e) {
      print(e);
      islodingforgot = false;
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
    return check;
  }
}
