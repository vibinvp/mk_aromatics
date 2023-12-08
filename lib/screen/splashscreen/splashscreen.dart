import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mk_aromatic_limited/common/local_notification_service.dart';
import 'package:mk_aromatic_limited/common/notification_helper.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLogin() async {
    final user = await LocalStorage.getUserLoggedInStatus();

    if (user == 'true') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return LandingScreen();
      }), (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return SignIn();
      }), (route) => false);
    }
  }

  AnimationController? animationController;
  Animation<double>? animation;
  startTime() async {
    await Geolocator.requestPermission();
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    checkLogin();
  }

  @override
  void initState() {
    // TODO: implement initState
    //notofication----------------

    FireBasePushNotificationService.notificationControll(context);
    LocalNotificationService.initnotification();

    //notofication----------------
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariabels.appColor,
      body: SafeArea(
        child: Column(
          children: [
            GlobalVariabels.vertical15,
            GlobalVariabels.vertical15,
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                    child: Container(
                      height: 33,
                      width: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "SKIP",
                        style: TextStyle(color: GlobalVariabels.appColor),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            GlobalVariabels.vertical40,
            GlobalVariabels.vertical40,
            GlobalVariabels.vertical40,
            SizedBox(
              height: 200,
              child:
                  Image.asset("assets/images/Logo-Swach-Bharath-and-Goa.png"),
            ),
            SizedBox(
              height: 200,
              child: Image.asset("assets/images/MK-Aromatic-Logo.png"),
            ),
            const Center(
              child: Text(
                "    Survey No: 310/1-A, PMC SWM\nFacility, Pernem, North Goa - 403512",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            GlobalVariabels.vertical40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    "Together, towards a plastic litter free Goa",
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
