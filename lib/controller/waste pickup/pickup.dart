// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/api/api_headers.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/pickup%20category/pickup_category.dart';
import 'package:mk_aromatic_limited/model/pickup%20sub%20category/pickup_sub_category.dart';
import 'package:mk_aromatic_limited/model/place%20order/place_order.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';

class ProfileController with ChangeNotifier {
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  String addressId = '';
  String profilePic = "";
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

  void setSelectAdrres(String address, String id) {
    addresscontroller.text = address;
    addressId = id;
    notifyListeners();
  }

  List<PickupCategoryList> wastetype = [];
  PickUpcategory? pickUpcategory;
  bool isLoadCategory = false;

  void wastePickUp(BuildContext context) async {
    try {
      isLoadCategory = true;
      notifyListeners();
      final user = await LocalStorage.getUserUserIdSF() ?? '';
      final response = await ApiBaseHelper.postAPICall(ApiEndPoint.wasteType, {
        'user_id': user,
      });

      if (response != null) {
        pickUpcategory = PickUpcategory.fromJson(response);
        if (pickUpcategory != null && pickUpcategory!.data != null) {
          wastetype = ((response['data']) as List)
              .map((data) => PickupCategoryList.fromJson(data))
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
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
  }

  List<PickupSubCategoryList> wastetypesub = [];
  PickUpSubcategory? pickUpsubcategory;
  bool isLoadsubCategory = false;

  void wastePickUpsub(BuildContext context, String id) async {
    try {
      isLoadsubCategory = true;
      notifyListeners();

      final response = await ApiBaseHelper.postAPICall(ApiEndPoint.wasteType, {
        'waste_type_id': id,
      });

      if (response != null) {
        pickUpsubcategory = PickUpSubcategory.fromJson(response);
        if (pickUpsubcategory != null && pickUpsubcategory!.data != null) {
          wastetypesub = ((response['data']) as List)
              .map((data) => PickupSubCategoryList.fromJson(data))
              .toList();

          isLoadsubCategory = false;
          notifyListeners();
        } else {
          isLoadsubCategory = false;

          notifyListeners();
        }
      } else {
        isLoadsubCategory = false;

        notifyListeners();
      }
    } catch (e) {
      isLoadsubCategory = false;
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
  }

  List<String> selectedSubCategories = [];

  setSubCate(bool? value, data) {
    if (value != null && value) {
      selectedSubCategories.add(data ?? ""); // Add the unique identifier
    } else {
      selectedSubCategories.remove(data); // Remove the unique identifier
    }
    notifyListeners();
  }

  String selectedCategories = '';

  setCategory(String data) {
    selectedCategories = data; // Add the unique identifier
    print(selectedCategories);
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  PlaceOrder? order;
  bool isLoadPlaceOrder = false;
  void placeOrder(BuildContext context, String addressId) async {
    try {
      isLoadPlaceOrder = true;
      notifyListeners();
      final userId = await LocalStorage.getUserUserIdSF() ?? '';

      String imagePath = image?.path ?? '';
      log('$imagePath  ----------');
      Dio dio = Dio();
      //final username = await LocalStorage.getUserNameFromSF();
      final headers = ApiHeader.header;
      String selectedsub = '';

      for (var i = 0; i < selectedSubCategories.length; i++) {
        selectedsub = i == 0
            ? '$selectedsub${selectedSubCategories[i]}'
            : '$selectedsub,${selectedSubCategories[i]}';
      }
      print(selectedsub);

      FormData formData = FormData.fromMap({
        'req_date': selectedDate.toString(),
        'user_id': userId,
        'weight': weightcontroller.text,
        'address_id': addressId,
        'sub_wastes': selectedsub,
        'waste_type': selectedCategories,
        'waste_img': imagePath.isEmpty
            ? ''
            : await MultipartFile.fromFile(
                imagePath,
                filename: imagePath
                    .split('/')
                    .last, // Use the last part of the path as filename
              ),
      });

      await dio.post(
        ApiEndPoint.placeorder,
        data: formData,
        options: Options(headers: headers),
        queryParameters: {
          'Content-type': 'application/json',
        },
      ).then((value) async {
        order = PlaceOrder.fromJson(value.data);

        if (order != null) {
          if (order!.status == true) {
            showToast(msg: order!.message ?? '', clr: AppColoring.successPopup);

            isLoadPlaceOrder = false;
            notifyListeners();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LandingScreen();
            }));
          } else {
            showToast(msg: order!.message ?? '', clr: AppColoring.errorPopUp);
            isLoadPlaceOrder = false;
            notifyListeners();
          }
        }
      });
    } catch (e) {
      print(e.toString());
      isLoadPlaceOrder = false;
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    } finally {}
  }
}
