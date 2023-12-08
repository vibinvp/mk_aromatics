import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/edit%20profile/edit_profile.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String userid;

  const EditProfile(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.userid});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late ProfileEditProvider profileEditProvider;

  @override
  void initState() {
    super.initState();
    profileEditProvider =
        Provider.of<ProfileEditProvider>(context, listen: false);
    profileEditProvider.usernameController.text = widget.name;
    profileEditProvider.mobileController.text = widget.number;
    profileEditProvider.emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Your Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: GlobalVariabels.appColor,
              minRadius: 45,
              maxRadius: 45,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            GlobalVariabels.vertical40,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: profileEditProvider.usernameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            GlobalVariabels.vertical15,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: profileEditProvider.mobileController,
                decoration: InputDecoration(
                  hintText: "Enter Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            GlobalVariabels.vertical15,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                enabled: false,
                controller: profileEditProvider.emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            GlobalVariabels.vertical40,
            Consumer(builder: (context, ProfileEditProvider value, _) {
              return PrimaryButton(
                onTap: () async {
                  value.editProfile(widget.userid, context);
                },
                label: "Submit",
              );
            }),
          ],
        ),
      ),
    );
  }
}
