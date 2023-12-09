import 'package:flutter/material.dart';

import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';

import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';
import 'package:provider/provider.dart';

class EditAddressController with ChangeNotifier {
  bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool get isLoading => _isLoading;

  Future<void> editAddress(BuildContext context, addressId) async {
    _isLoading = true;
    notifyListeners();

    var parameters = {
      'address_id': addressId,
      'name': nameController.text,
      'address': addressController.text,
      'area': areaController.text,
      'pincode': pincodeController.text,
      'city': cityController.text,
      'state': stateController.text,
      'mobile': mobileController.text,
    };

    try {
      await ApiBaseHelper.postAPICall(ApiEndPoint.editAddress, parameters)
          .then((response) async {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          Navigator.pop(context);

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
