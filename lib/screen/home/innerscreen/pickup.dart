import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/waste%20pickup/pickup.dart';
import 'package:mk_aromatic_limited/model/pickup%20category/pickup_category.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';
import 'package:provider/provider.dart';

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({super.key});

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/MK-Aromatic-BG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ],
                    ),
                    const Text(
                      "Select your waste type",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    GlobalVariabels.vertical15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: ScreenWidth * 0.9,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: WasteManagementDropdown(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WasteManagementDropdown extends StatefulWidget {
  const WasteManagementDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WasteManagementDropdownState createState() =>
      _WasteManagementDropdownState();
}

class _WasteManagementDropdownState extends State<WasteManagementDropdown> {
  bool _validateWeight = false;

  late ProfileController profileController;
  @override
  void initState() {
    super.initState();
    profileController = Provider.of<ProfileController>(context, listen: false);

    profileController.selectedSubCategories = [];

    profileController.wastetypesub = [];
    profileController.selectedCategories = '';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileController.wastePickUp(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalVariabels.vertical15,
        GlobalVariabels.vertical15,
        Container(
          width: ScreenWidth * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Consumer(builder: (context, ProfileController data, _) {
              return data.isLoadCategory
                  ? const SizedBox(
                      height: 80,
                      child: SingleBallnerItemSimmer(),
                    )
                  : DropdownButtonFormField(
                      decoration: const InputDecoration(
                          hintText: "Select Category  ",
                          border: InputBorder.none),
                      onChanged: (String? newValue) {
                        for (var element in data.wastetype) {
                          if (element.id == newValue) {
                            data.setCategory(element.wasteName ?? '');
                          }
                        }
                        data.wastePickUpsub(context, newValue ?? '');
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please select a waste type';
                      //   }
                      //   return null;
                      // },
                      items: data.pickUpcategory!.data!
                          .map<DropdownMenuItem<String>>(
                              (PickupCategoryList value) {
                        return DropdownMenuItem<String>(
                          value: value.id,
                          child: Text(value.wasteName ?? ''),
                        );
                      }).toList(),
                    );
            }),
          ),
        ),
        GlobalVariabels.vertical10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Consumer(builder: (context, ProfileController data, _) {
            return data.isLoadsubCategory
                ? const SizedBox(
                    height: 280,
                    child: ShimmerEffect(),
                  )
                : data.wastetypesub.isEmpty
                    ? const Center(
                        child: Text('No data'),
                      )
                    : Column(
                        children: data.wastetypesub.map((subCategory) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: CheckboxListTile(
                                activeColor: GlobalVariabels.appColor,
                                title: Center(
                                  child: Text(
                                    subCategory.subWasteType ?? '',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                value: data.selectedSubCategories.contains(
                                    subCategory
                                        .subWasteType), // Use a unique identifier
                                onChanged: (bool? value) {
                                  data.setSubCate(
                                      value, subCategory.subWasteType);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
          }),
        ),
        GlobalVariabels.vertical10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: ScreemHight * 0.05,
                  width: ScreenWidth * 0.5,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Approximate Weight",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  )),
              Container(
                width: ScreenWidth * 0.13,
                height: ScreemHight * 0.05,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
                child: TextFormField(
                  controller: profileController.weightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "   KG",
                    errorText:
                        _validateWeight ? 'Please enter a valid weight' : null,
                  ),
                ),
              ),
            ],
          ),
        ),
        GlobalVariabels.vertical10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return SimpleDialog(
                              insetPadding: const EdgeInsets.symmetric(
                                horizontal: 100,
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await profileController
                                            .getImage(ImageSource.gallery);

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
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        profileController
                                            .getImage(ImageSource.camera);

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
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 45,
                      )),
                ),
                GlobalVariabels.vertical5,
                Consumer(builder: (context, ProfileController value, _) {
                  int originalStringLength =
                      value.image == null ? 0 : value.image!.path.length;

                  // Use substring to get the last 10 characters
                  String last10Characters = '';
                  if (value.image != null) {
                    last10Characters = value.image!.path.substring(
                        originalStringLength - 15, originalStringLength);
                  }
                  return Text(value.image == null
                      ? "select image"
                      : last10Characters.replaceAll('/', ''));
                }),
              ],
            ),
            Consumer(builder: (context, ProfileController value, _) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {
                          value.selectDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          size: 45,
                        )),
                  ),
                  GlobalVariabels.vertical5,
                  Text(value.selectedDate.toString().split(" ").first)
                ],
              );
            }),
          ],
        ),
        GlobalVariabels.vertical10,
        GlobalVariabels.vertical10,
        PrimaryButton(
            onTap: () {
              if (profileController.selectedCategories.trim().isEmpty) {
                showToast(msg: "Select category", clr: AppColoring.errorPopUp);
              } else if (profileController.selectedSubCategories.isEmpty) {
                showToast(
                    msg: "Select Waste Type", clr: AppColoring.errorPopUp);
              } else if (profileController.weightcontroller.text
                  .trim()
                  .isEmpty) {
                showToast(msg: "Enter Weight", clr: AppColoring.errorPopUp);
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddressScreen();
                }));
              }
            },
            label: "Submit"),
        GlobalVariabels.vertical15
      ],
    );
  }
}
