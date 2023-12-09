import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/core/app_constant.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/appSetting/appsettingcontroller.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class ChooseScreen5 extends StatefulWidget {
  const ChooseScreen5({super.key});

  @override
  State<ChooseScreen5> createState() => _ChooseScreen5();
}

class _ChooseScreen5 extends State<ChooseScreen5> {
  late RegistrationProvider registrationProvider;
  late AppsettingController appsettingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    appsettingController =
        Provider.of<AppsettingController>(context, listen: false);
    registrationProvider.getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registrationProvider.getSubcategoryList(context);
    });
  }

  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: ScreemHight * 0.4,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 95, 39),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Center(
                child: Text(
              "Welcome",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: 230,
            child: Container(
              //height: ScreemHight * 0.4,
              width: ScreenWidth * 0.3,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: GlobalVariabels.appColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        registrationProvider.usernameController.text,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        registrationProvider.emailController.text,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      Consumer(
                          builder: (context, AppsettingController value, _) {
                        return value.appsetting.isEmpty
                            ? const Text(
                                'Welcome to ${AppConstant.appName}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            : HtmlWidget(
                                // value.appsetting[0].welMessage
                                //             .toString()
                                //             .length >
                                //         100
                                //     ? value.appsetting[0].welMessage
                                //         .toString()
                                //         .substring(0, 200)
                                //     :
                                value.appsetting[0].welMessage ?? '',
                                onErrorBuilder: (context, element, error) =>
                                    Text('$element error: $error'),
                                onLoadingBuilder:
                                    (context, element, loadingProgress) =>
                                        const SizedBox(
                                  height: 600,
                                  child: CircularProgressIndicator(),
                                ),

                                onTapUrl: (url) {
                                  return true;
                                },

                                renderMode: RenderMode.column,

                                // set the default styling for text
                                textStyle: const TextStyle(fontSize: 14),
                              );
                      }),
                      GlobalVariabels.vertical15,
                      Consumer<RegistrationProvider>(
                          builder: (context, value, _) {
                        return value.isLoadSndOtp
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                width: ScreenWidth * 0.3,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(255, 255, 95, 39),
                                    )),
                                    onPressed: () {
                                      value.sndotp(context);
                                      // value.registration(
                                      //     value.selectedSubCatId, context);
                                    },
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              );
                      }),
                    ],
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: GlobalVariabels.appColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
