import 'package:mk_aromatic_limited/helper/api/base_constatnt.dart';

class ApiEndPoint {
  static const String userLogin = '${ApiBaseConstant.baseUrlAPI}login';
  static const String usersndOtp = '${ApiBaseConstant.baseUrlAPI}send_otp';

  static const String userRegister = '${ApiBaseConstant.baseUrlAPI}register';
  static const String getcategory = '${ApiBaseConstant.baseUrlAPI}getCategory';
  static const String getSubCategory =
      '${ApiBaseConstant.baseUrlAPI}getSubCategory';
  static const String editUser = '${ApiBaseConstant.baseUrlAPI}updateProfile';
  static const String gethistory =
      '${ApiBaseConstant.baseUrlAPI}WasteRequestFormHistory';
  static const String getAddress = '${ApiBaseConstant.baseUrlAPI}reqAddressGet';
  static const String addAddress = '${ApiBaseConstant.baseUrlAPI}reqAddressAdd';
  static const String removeAddress =
      '${ApiBaseConstant.baseUrlAPI}reqAddressDelete';
  static const String editAddress =
      '${ApiBaseConstant.baseUrlAPI}reqAddressedit';
  static const String pickUp =
      '${ApiBaseConstant.baseUrlAPI}addWasteRequestForm';
  static const String wasteType = '${ApiBaseConstant.baseUrlAPI}wasteType';
  static const String placeorder =
      '${ApiBaseConstant.baseUrlAPI}addWasteRequestForm';
  static const String fcmKey = '${ApiBaseConstant.baseUrlAPI}updateFcmKey';
  static const String getAppSetting =
      '${ApiBaseConstant.baseUrlAPI}getAppSetting';
  static const String forgetpassword =
      '${ApiBaseConstant.baseUrlAPI}forget_password';
  static const String getNotification =
      '${ApiBaseConstant.baseUrlAPI}getNotification';
}
