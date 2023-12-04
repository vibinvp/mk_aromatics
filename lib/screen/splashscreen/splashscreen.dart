import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
