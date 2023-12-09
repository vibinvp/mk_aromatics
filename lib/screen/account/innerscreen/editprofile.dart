import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/app_constant.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/edit%20profile/edit_profile.dart';
import 'package:mk_aromatic_limited/controller/waste%20pickup/pickup.dart';
import 'package:mk_aromatic_limited/helper/api/base_constatnt.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    profileEditProvider.isLoading = false;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileEditProvider.getPP();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Your Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InkWell(
              //   onTap: () {},
              //   child: const CircleAvatar(
              //     backgroundColor: GlobalVariabels.appColor,
              //     minRadius: 45,
              //     maxRadius: 45,
              //     child: Icon(
              //       Icons.person,
              //       size: 50,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 100,
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await profileEditProvider
                                      .getprofileImage(ImageSource.gallery);

                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pop();
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 40,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                onTap: () async {
                                  profileEditProvider
                                      .getprofileImage(ImageSource.camera);

                                  Navigator.of(context).pop();
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Center(
                    child: Consumer(
                      builder: (context, ProfileEditProvider value, child) {
                        return value.profileImage == null
                            ? value.profilePic.isNotEmpty
                                ? Stack(
                                    children: [
                                      Container(
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          color: AppColoring.kAppWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) {
                                                return const Icon(Icons.error);
                                              },
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                      downloadProgress) {
                                                return Container(
                                                    height: 130,
                                                    width: 140,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child:
                                                        SingleBallnerItemSimmer());
                                              },
                                              fit: BoxFit.fill,
                                              imageUrl: ApiBaseConstant
                                                      .baseMainUrl +
                                                  AppConstant.profileImageUrl +
                                                  value.profilePic),
                                        ),
                                      ),
                                      const Positioned(
                                        bottom: 15,
                                        left: 80,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColoring.lightBg,
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 130,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/MK-Aromatic-Logo.png')),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColoring.lightBg,
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  )
                            : CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.black,
                                backgroundImage: FileImage(value.profileImage!),
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColoring.lightBg,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
              GlobalVariabels.vertical40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.phone,
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
                return value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButton(
                        onTap: () async {
                          value.editProfile(context);
                        },
                        label: "Submit",
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
