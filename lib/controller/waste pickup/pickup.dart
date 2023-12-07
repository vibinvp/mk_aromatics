// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/model/pickup%20category/pickup_category.dart';

class ProfileController with ChangeNotifier {
  File? image;
  Future<void> getImage(ImageSource source) async {
    final pikImage = await ImagePicker().pickImage(
      source: source,
    );
    if (pikImage == null) {
      return;
    } else {
      final imageTemp = File(pikImage.path);
      image = imageTemp;

      notifyListeners();
      log("image picked  $image ");
    }
  }

  PickUpcategory? pickUpcategory;
  bool isLoadCategory = true;

  void wastePickUp(BuildContext context) async {
    try {
      isLoadCategory = true;
      notifyListeners();

      final response =
          await ApiBaseHelper.postAPICall(ApiEndPoint.wasteType, {});

      if (response != null) {
        getAddressModel = GetAddress.fromJson(response);
        if (getAddressModel != null && getAddressModel!.data != null) {
          addressList = ((response['data']) as List)
              .map((data) => GetAddressList.fromJson(data))
              .toList();

          isLoadCategory = false;
          notifyListeners();
        } else {
          isLoadCategory = false;

          notifyListeners();
        }
      } else {
        isLoadCategory = false;

        notifyListeners();
      }
    } catch (e) {
      isLoadCategory = false;
      print("Error occurred category: $e");
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
  }
}
