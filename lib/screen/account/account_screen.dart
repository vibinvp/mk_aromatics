import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/core/message.dart';

import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/helper/storage/localstorage.dart';
import 'package:mk_aromatic_limited/screen/account/innerscreen/editprofile.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late String name = "";
  late String mobileNumber = "";

  late String email = "";
  late String UserId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadName();
    LoadMobile();
    LoadEmail();
    userid();
  }

  Future<void> _loadName() async {
    final loadedName = await LocalStorage.getNameSF();
    setState(() {
      name = loadedName ?? "Default Name";
      print('ssssssssssssssssssssssss$name');
    });
  }

  Future<void> LoadMobile() async {
    final loadednumber = await LocalStorage.getUserMobileFromSF();
    setState(() {
      mobileNumber = loadednumber ?? "Default Name";
    });
  }

  Future<void> LoadEmail() async {
    final loadedEmail = await LocalStorage.getUserEmailFromSF();
    setState(() {
      email = loadedEmail ?? "Default Name";
    });
  }

  Future<void> userid() async {
    final loadedId = await LocalStorage.getUserUserIdSF();
    setState(() {
      UserId = loadedId ?? "Default Name";
      print('ssssssssssssssssssssssss$UserId');
    });
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
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
                },
                icon: Icon(Icons.logout))
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/MK-Aromatic-BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  //  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     blurRadius: 3.0,
                      //     offset: Offset(2, 2),
                      //   ),
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical10,
                        const Text(
                          "Edit Your Profile",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical15,
                        const Center(
                          child: CircleAvatar(
                            backgroundColor: GlobalVariabels.appColor,
                            minRadius: 25,
                            maxRadius: 25,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GlobalVariabels.vertical15,
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical15,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return EditProfile(
                                      name: name,
                                      number: mobileNumber,
                                      email: email,
                                      userid: UserId,
                                    );
                                  }));
                                },
                                child: SizedBox(
                                    height: 25,
                                    child: Image.asset(
                                        "assets/images/IMG_3346.jpg")),
                              )
                            ],
                          ),
                        ),
                        GlobalVariabels.vertical15,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mobileNumber.toString(),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        GlobalVariabels.vertical15,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                email,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical15,
                        GlobalVariabels.vertical10,
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electron",
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w300),
                          ),
                        ),
                        GlobalVariabels.vertical10,
                        GlobalVariabels.vertical15,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
