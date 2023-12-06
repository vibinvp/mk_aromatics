import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/screen/account/account_screen.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';

class ProfileEditProvider with ChangeNotifier {
  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool get isLoading => _isLoading;

  //Registration? registrationModel;
  Future<void> editProfile(String userid, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    var parameters = {'user_id': userid, 'fullname': usernameController.text};

    try {
      await ApiBaseHelper.postAPICall(ApiEndPoint.editUser, parameters)
          .then((response) async {
        _isLoading = false;
        notifyListeners();

        if (response != null) {
          await LocalStorage.saveUserEmailSF(emailController.text);

          await LocalStorage.saveNameSF(usernameController.text);

          await LocalStorage.saveUserMobileSF(mobileController.text);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LandingScreen();
          }), (route) => false);

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
