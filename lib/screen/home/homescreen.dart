import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/constants/core/assets/app_icons.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/pickup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          backgroundColor:
              Colors.transparent, // Set background color to transparent
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/MK-Aromatic-BG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Pickup image.jpg"),
                GlobalVariabels.vertical15,
                PrimaryButton(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const PickUpScreen();
                    }));
                  },
                  label: "Pick Up",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
