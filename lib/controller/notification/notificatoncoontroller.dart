import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/getAddress.dart/getaddress_model.dart';
import 'package:mk_aromatic_limited/model/notification/notification_model.dart';

class NotificationController with ChangeNotifier {
  List<NotificationList> notifications = [];
  NotificationModel? notificationModel;
  bool isLoading = true;

  void getnotification(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      final user = await LocalStorage.getUserUserIdSF() ?? '';
      final response =
          await ApiBaseHelper.postAPICall(ApiEndPoint.getNotification, {
        'user_id': user,
      });

      if (response != null) {
        notificationModel = NotificationModel.fromJson(response);
        if (notificationModel != null && notificationModel!.data != null) {
          notifications = ((response['data']) as List)
              .map((data) => NotificationList.fromJson(data))
              .toList();

          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;

          notifyListeners();
        }
      } else {
        isLoading = false;

        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      print("Error occurred category: $e");
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    }
  }
}
