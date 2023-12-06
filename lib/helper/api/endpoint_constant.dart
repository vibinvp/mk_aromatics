import 'package:mk_aromatic_limited/helper/api/base_constatnt.dart';

class ApiEndPoint {
  static const String userLogin = '${ApiBaseConstant.baseUrlAPI}login';
  static const String usersndOtp = '${ApiBaseConstant.baseUrlAPI}sent_otp';

  static const String userRegister = '${ApiBaseConstant.baseUrlAPI}register';
  static const String getcategory = '${ApiBaseConstant.baseUrlAPI}getCategory';
  static const String getSubCategory =
      '${ApiBaseConstant.baseUrlAPI}getSubCategory';
  static const String editUser = '${ApiBaseConstant.baseUrlAPI}updateProfile';
}
