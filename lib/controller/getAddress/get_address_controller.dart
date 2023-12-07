import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/getAddress.dart/getaddress_model.dart';

class GetAddressController with ChangeNotifier {
  List<GetAddressList> addressList = [];
  GetAddress? getAddressModel;
  bool isLoadCategory = true;

  void geAddress(BuildContext context) async {
    try {
      isLoadCategory = true;
      notifyListeners();
      final user = await LocalStorage.getUserUserIdSF() ?? '';
      final response = await ApiBaseHelper.postAPICall(ApiEndPoint.getAddress, {
        'user_id': user,
      });

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
