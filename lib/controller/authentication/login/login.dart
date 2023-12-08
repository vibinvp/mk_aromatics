import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/model/login/loginmodel.dart';

import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], password: json['password']);
  }
}

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  LoginModel? loginModel;

  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    var param = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      ApiBaseHelper.postAPICall(ApiEndPoint.userLogin, param)
          .then((response) async {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          loginModel = LoginModel.fromJson(response);

          if (loginModel != null && loginModel!.status == true) {
            _isLoading = false;
            notifyListeners();
            showToast(msg: loginModel!.message ?? '', clr: Colors.green);

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return const LandingScreen();
              }),
              (route) => false,
            );
            var getmodel = loginModel!.data![0];
            updateFcmToken(getmodel.userId.toString(), context);
            await LocalStorage.saveUserLoggedInStatus('true');

            await LocalStorage.saveUserEmailSF(getmodel.email.toString());
            await LocalStorage.saveUserUserIdSF(getmodel.userId.toString());
            await LocalStorage.saveNameSF(getmodel.fullname.toString());

            //await LocalStorage.saveUserLastNameSF(getmodel.lastname.toString());
            // await LocalStorage.saveUserPPSF(getmodel.profileAvatar.toString());
            await LocalStorage.saveUserMobileSF(getmodel.mobile.toString());
            await LocalStorage.saveUserPasswordSF(
                passwordController.text.toString());
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

  Future<void> updateFcmToken(String? userId, context) async {
    try {
      final fcmToken = await LocalStorage.getUseFcmTokentSF();
      userId = userId == '' ? await LocalStorage.getUserUserIdSF() : userId;
      var paremeters = {
        'user_id': userId,
        'fcm_key': fcmToken,
      };
      final response =
          await ApiBaseHelper.postAPICall(ApiEndPoint.fcmKey, paremeters);

      if (response != null) {
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred: $e");
      }
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
  }
}
