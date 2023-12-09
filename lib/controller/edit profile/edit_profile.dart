import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/helper/api/api_headers.dart';
import 'package:mk_aromatic_limited/helper/api/api_post_request.dart';
import 'package:mk_aromatic_limited/helper/api/endpoint_constant.dart';
import 'package:mk_aromatic_limited/helper/exception/dio_exception.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/model/profile%20pdate/profile_update.dart';

import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';
import 'package:provider/provider.dart';

class ProfileEditProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String profilePic = "";

  File? profileImage;
  Future<void> getprofileImage(ImageSource source) async {
    final pikImage = await ImagePicker().pickImage(
      source: source,
    );
    if (pikImage == null) {
      return;
    } else {
      final imageTemp = File(pikImage.path);
      profileImage = imageTemp;

      notifyListeners();
      print("image picked  $profileImage ");
    }
  }

  void getPP() async {
    profilePic = await LocalStorage.getUserPPSF() ?? '';
    print(profilePic);
    notifyListeners();
  }

  UpdateProfile? updateProfile;

  Future<void> editProfile(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      final userId = await LocalStorage.getUserUserIdSF() ?? '';

      String imagePath = profileImage?.path ?? '';
      log('$imagePath  ----------');
      Dio dio = Dio();
      //final username = await LocalStorage.getUserNameFromSF();
      final headers = ApiHeader.header;

      FormData formData = FormData.fromMap({
        'user_id': userId,
        'email': emailController.text,
        'fullname': usernameController.text,
        'mobile': mobileController.text,
        'prof_img': imagePath.isEmpty
            ? ''
            : await MultipartFile.fromFile(
                imagePath,
                filename: imagePath
                    .split('/')
                    .last, // Use the last part of the path as filename
              ),
      });

      await dio.post(
        ApiEndPoint.editUser,
        data: formData,
        options: Options(headers: headers),
        queryParameters: {
          'Content-type': 'application/json',
        },
      ).then((response) async {
        if (response.data != null) {
          updateProfile = UpdateProfile.fromJson(response.data);

          if (updateProfile != null && updateProfile!.status == true) {
            print(updateProfile!.data.toString());
            var getmodel = updateProfile!.data![0];
            isLoading = false;
            notifyListeners();
            showToast(msg: updateProfile!.message ?? '', clr: Colors.green);

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return const LandingScreen();
              }),
              (route) => false,
            );

            await LocalStorage.saveUserLoggedInStatus('true');

            await LocalStorage.saveUserEmailSF(getmodel.email.toString());
            await LocalStorage.saveUserUserIdSF(getmodel.userId.toString());
            await LocalStorage.saveNameSF(getmodel.fullname.toString());

            //await LocalStorage.saveUserLastNameSF(getmodel.lastname.toString());
            await LocalStorage.saveUserPPSF(getmodel.pp.toString());
            await LocalStorage.saveUserMobileSF(getmodel.mobile.toString());

            getPP();
          } else {
            isLoading = false;
            notifyListeners();
            showToast(msg: updateProfile!.message ?? '', clr: Colors.red);
          }
        } else {
          isLoading = false;
          notifyListeners();
        }
      });
    } catch (e) {
      print(e.toString());
      isLoading = false;
      notifyListeners();
      DioExceptionhandler.errorHandler(e);
    } finally {}
  }
}
