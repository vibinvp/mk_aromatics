import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mk_aromatic_limited/helper/api/base_constatnt.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';

class RegistrationProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> registration(
    String username,
    String password,
    String mobile,
    String email,
    String fullname,
    String address,
    String city,
    String pincode,
    String state,
  ) async {
    _isLoading = true;
    notifyListeners();

    String apiUrl = ApiEndPoint.userRegister;

    try {
      print("aaaaaaaaaaa$apiUrl");
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "X-API-KEY": "XiH9yEKiUG1t533VyeBddDB0630MIoMh39QWtVpy",
        },
        body: {
          "email": email,
          "password": password,
        },
      );

      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        print("Login successfull: ${response.statusCode}");

        return true;
      } else {
        print("Login failed: ${response.statusCode}");
        print("Response body: ${response.body}");

        Map<String, dynamic> errorResponse = json.decode(response.body);
        print("Error message: ${errorResponse['error']}");

        return false;
      }
    } catch (e) {
      print("Error during login: $e");

      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
