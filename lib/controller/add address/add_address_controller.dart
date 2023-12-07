import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/getAddress.dart/getaddress_model.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';
import 'package:provider/provider.dart';

class AdddAddressController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //Registration? registrationModel;
  Future<void> addAddress(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final userid = await LocalStorage.getUserUserIdSF() ?? '';

    var parameters = {
      'user_id': userid,
      'name': nameController.text,
      'address': addressController.text,
      'area': areaController.text,
      'pincode': pincodeController.text,
      'city': cityController.text,
      'state': stateController.text,
      'mobile': mobileController.text,
    };

    try {
      await ApiBaseHelper.postAPICall(ApiEndPoint.addAddress, parameters)
          .then((response) async {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          if (response['status'] == true) {
            Navigator.pop(context);
            context.read<GetAddressController>().geAddress(context);
            notifyListeners();
          } else {
            showToast(
                msg: response['message'].toString(),
                clr: AppColoring.errorPopUp);
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
}
