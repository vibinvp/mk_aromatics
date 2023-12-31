import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/history/historymodel.dart';

class HistoryController with ChangeNotifier {
  String name = "";
  String mobileNumber = "";

  String email = "";
  String userId = "";

  void loadName() async {
    name = await LocalStorage.getNameSF() ?? '';
    mobileNumber = await LocalStorage.getUserMobileFromSF() ?? '';
    userId = await LocalStorage.getUserUserIdSF() ?? '';

    print('ssssssssssssssssssssssss$userId');
  }

  List<HistoryList> historyList = [];
  History? historyModel;
  bool isLoadCategory = true;

  void getHistoryList(BuildContext context) async {
    try {
      isLoadCategory = true;
      notifyListeners();
      final user = await LocalStorage.getUserUserIdSF() ?? '';
      final response = await ApiBaseHelper.postAPICall(ApiEndPoint.gethistory, {
        'user_id': user,
      });

      if (response != null) {
        historyModel = History.fromJson(response);
        if (historyModel != null && historyModel!.data != null) {
          historyList = ((response['data']) as List)
              .map((data) => HistoryList.fromJson(data))
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
