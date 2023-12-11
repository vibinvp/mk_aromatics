import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';

class BookingConfirmed extends StatefulWidget {
  const BookingConfirmed({super.key});

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/MK-Aromatic-BG.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animations/Animation - 1702273494793.json"),
            const SizedBox(
              height: 100,
            ),
            PrimaryButton(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const LandingScreen();
                  }), (route) => false);
                },
                label: "Done")
          ],
        ),
      ),
    );
  }
}
