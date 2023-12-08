import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:provider/provider.dart';

class FcmKeyController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //Registration? registrationModel;
  Future<void> fcmKey(BuildContext context, addressid) async {
    final userid = await LocalStorage.getUserUserIdSF() ?? '';
    final fcmkey = await LocalStorage.getUseFcmTokentSF() ?? '';
    _isLoading = true;
    notifyListeners();

    var parameters = {'user_id': userid, 'fcm_key': fcmkey};

    try {
      await ApiBaseHelper.postAPICall(ApiEndPoint.fcmKey, parameters)
          .then((response) async {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          Navigator.of(context).pop();
          context.read<GetAddressController>().geAddress(context);

          notifyListeners();
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
}
