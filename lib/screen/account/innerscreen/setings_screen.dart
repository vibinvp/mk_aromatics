import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/routes.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/screen/HTML_Page/tems_contact_pages.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _getDrawerItem('Privacy Policy', Icons.info, 4, context),
          _getDrawerItem('Faqs', Icons.chat, 5, context),
          _getDrawerItem('Terms & Conditions', Icons.lock, 6, context),
          _getDrawerItem('Contact Us', Icons.call, 7, context),
          _getDrawerItem('Logout', Icons.logout, 8, context),
        ],
      ),
    );
  }

  _getDrawerItem(
      String title, IconData? icon, int index, BuildContext context) {
    return ListTile(
      trailing: const Icon(
        Icons.arrow_right,
        color: AppColoring.kAppColor,
      ),
      leading: Icon(icon),
      dense: true,
      title: Text(
        title == 'Faqs' ? 'FAQs' : title,
        style: const TextStyle(
          color: AppColoring.textDark,
          fontSize: 15,
        ),
      ),
      onTap: () {
        if (index == 1) {
        } else if (index == 2) {
        } else if (index == 3) {
        } else if (index == 4) {
          RouteConstat.nextNamed(
              context,
              TermsAndConditionsHtmlView(
                title: title,
                code: title[0],
              ));
        } else if (index == 5) {
          RouteConstat.nextNamed(
              context,
              TermsAndConditionsHtmlView(
                title: title,
                code: title[0],
              ));
        } else if (index == 6) {
          RouteConstat.nextNamed(
              context,
              TermsAndConditionsHtmlView(
                title: title,
                code: title[0],
              ));
        } else if (index == 7) {
          RouteConstat.nextNamed(
              context,
              TermsAndConditionsHtmlView(
                title: title,
                code: title[0],
              ));
          // RouteConstat.nextNamed(
          //     context,
          //     const ScreenContactUs(
          //         // title: title,
          //         // code: title[0],
          //         ));
        } else if (index == 9) {
        } else if (index == 10) {
        } else if (index == 8) {
          //  logoutPOPUP(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Are You Sure?'),
                content: const Text('Do you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      appLogOut(context);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  void appLogOut(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const SignIn();
    }), (route) => false);
    await LocalStorage.saveUserLoggedInStatus('false');
    await LocalStorage.saveUserEmailSF("");
    await LocalStorage.saveNameSF("");
    await LocalStorage.saveUserUserIdSF("");
    await LocalStorage.saveUserNameSF("");
    await LocalStorage.saveUserAddressSF("");
    await LocalStorage.saveUserPPSF("");
    await LocalStorage.saveUserCitySF("");
    await LocalStorage.saveUserLatSF("");
    await LocalStorage.saveUserLngSF("");
    await LocalStorage.saveUserSexSF("");
    await LocalStorage.saveUserPincodeSF("");
    await LocalStorage.saveUserPPSF("");

    showToast(msg: "Logout Successfully", clr: Colors.green);
  }
}
