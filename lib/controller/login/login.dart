import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';

import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/model/login/loginmodel.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool get isLoading => _isLoading;
  LoginModel? loginModel;

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    var param = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      ApiBaseHelper.postAPICall(ApiEndPoint.userLogin, param).then((response) {
        _isLoading = false;
        notifyListeners();
        if (response != null) {
          loginModel = LoginModel.fromJson(response);
          if (loginModel != null && loginModel!.status == true) {
            _isLoading = false;
            showToast(msg: loginModel!.message ?? '', clr: Colors.green);
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) {
            //   return ChooseScreen6();
            // }), (route) => false);
            notifyListeners();
          } else {
            _isLoading = false;

            notifyListeners();
            showToast(msg: loginModel!.message ?? '', clr: Colors.red);
          }
        } else {
          _isLoading = false;

          notifyListeners();
        }
      });
    } catch (e) {
      print("Error during login: $e");

      _isLoading = false;
      notifyListeners();
    }
  }
}
