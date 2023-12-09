import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/app%20setting/appsettingmodel.dart';
import 'package:mk_aromatic_limited/model/getAddress.dart/getaddress_model.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';
import 'package:provider/provider.dart';

class AppsettingController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool isLoadingappsetting = false;

  bool get isLoading => isLoadingappsetting;
  List<AppSettingList> appsetting = [];
  AppSettingModel? appSettingModel;
  Future<void> appSettingdetails(BuildContext context) async {
    isLoadingappsetting = true;
    notifyListeners();

    try {
      await ApiBaseHelper.getAPICall(ApiEndPoint.getAppSetting, {})
          .then((response) async {
        isLoadingappsetting = false;
        notifyListeners();

        if (response != null) {
          appSettingModel = AppSettingModel.fromJson(response);
          if (appSettingModel != null && appSettingModel!.data != null) {
            appsetting = ((response['data']) as List)
                .map((data) => AppSettingList.fromJson(data))
                .toList();

            isLoadingappsetting = false;
            notifyListeners();
          } else {
            isLoadingappsetting = false;

            notifyListeners();
          }
        } else {
          isLoadingappsetting = false;

          notifyListeners();
        }
      });
    } catch (e) {
      print("Error during registration: $e");

      isLoadingappsetting = false;
      notifyListeners();
    }
  }
}
