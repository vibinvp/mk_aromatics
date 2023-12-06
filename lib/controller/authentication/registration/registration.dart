import 'dart:convert';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';

import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/model/category.dart';
import 'package:mk_aromatic_limited/model/registration/registrationmodel.dart';
import 'package:mk_aromatic_limited/model/subcat.dart';

import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen6.dart';

class RegistrationProvider with ChangeNotifier {
  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool get isLoading => _isLoading;
  String lat = "0";
  String log = "0";

  Future getCurrentLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      await Geolocator.requestPermission();
    } else {
      Geolocator.getCurrentPosition().then((value) async {
        lat = value.latitude.toString();
        log = value.longitude.toString();

        //  log(latitudeController.text.toString());
        // log(longitudeController.text.toString());
        List<Placemark> placemark =
            await placemarkFromCoordinates(value.latitude, value.longitude);

        var address;
        address = placemark[0].name;
        address = address + ',' + placemark[0].subLocality;
        address = address + ',' + placemark[0].locality;
        address = address + ',' + placemark[0].administrativeArea;
        address = address + ',' + placemark[0].country;
        address = address + ',' + placemark[0].postalCode;
        addressController.text = address ?? '';
        cityController.text = placemark[0].locality ?? '';
        pincodeController.text = placemark[0].postalCode ?? '';
        stateController.text = placemark[0].administrativeArea ?? '';
        notifyListeners();
      });
    }
  }

  Registration? registrationModel;
  Future<void> registration(String subid, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    var parameters = {
      'username': usernameController.text,
      'password': passwordController.text,
      'mobile': mobileController.text,
      'email': emailController.text,
      'fullname': usernameController.text,
      'address': addressController.text,
      'city': cityController.text,
      'pincode': pincodeController.text,
      'state': stateController.text,
      'lattitude': lat,
      'longitude': log,
      'sub_category_id': subid.toString(),
    };

    try {
      await ApiBaseHelper.postAPICall(ApiEndPoint.userRegister, parameters)
          .then((response) {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          registrationModel = Registration.fromJson(response);
          if (registrationModel != null && registrationModel!.status == true) {
            _isLoading = false;
            showToast(msg: registrationModel!.message ?? '', clr: Colors.green);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return ChooseScreen6();
            }), (route) => false);
            notifyListeners();
          } else {
            _isLoading = false;

            notifyListeners();
            showToast(msg: registrationModel!.message ?? '', clr: Colors.red);
          }
        } else {
          _isLoading = false;

          notifyListeners();
        }
      });
    } catch (e) {
      print("Error during registration: $e");

      _isLoading = false;
      notifyListeners();
    }
  }

  List<CatagoryList> categoryList = [];
  CategoryModel? categoryModel;
  bool isLoadCategory = false;

  void getcategoryList(BuildContext context) async {
    try {
      isLoadCategory = true;
      notifyListeners();

      final response =
          await ApiBaseHelper.getAPICall(ApiEndPoint.getcategory, {});

      if (response != null) {
        categoryModel = CategoryModel.fromJson(response);
        if (categoryModel != null && categoryModel!.data != null) {
          categoryList = ((response['data']) as List)
              .map((data) => CatagoryList.fromJson(data))
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

  String selectedcatId = '';
  String selectedSubCatId = '';
  void selectedCategory(String catId) {
    selectedcatId = catId;
    print(selectedcatId);
    notifyListeners();
  }

  void selectedSubCategory(String catId) {
    selectedSubCatId = catId;
    notifyListeners();
  }

  List<SubCategorylist> subcategoryList = [];
  SubCategoryModel? subcategoryModel;
  bool isLoadSubCategory = false;

  Future<bool> getSubcategoryList(
    BuildContext context,
  ) async {
    bool isTrue = false;

    try {
      isLoadSubCategory = true;
      notifyListeners();

      final response = await ApiBaseHelper.postAPICall(
          ApiEndPoint.getSubCategory, {'category_id': selectedcatId});
      print(response.toString());
      if (response != null) {
        subcategoryModel = SubCategoryModel.fromJson(response);
        if (subcategoryModel != null && subcategoryModel!.data != null) {
          subcategoryList = ((response['data']) as List)
              .map((data) => SubCategorylist.fromJson(data))
              .toList();
          isTrue = true;
          isLoadSubCategory = false;
          notifyListeners();
        } else {
          isLoadSubCategory = false;

          notifyListeners();
        }
      } else {
        isLoadSubCategory = false;

        notifyListeners();
      }
      return isTrue;
    } catch (e) {
      isLoadSubCategory = false;
      print("Error occurred category: $e");
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
    return isTrue;
  }
}
