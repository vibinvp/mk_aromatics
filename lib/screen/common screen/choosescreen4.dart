import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen5.dart';
import 'package:provider/provider.dart';

class ChooseScreen4 extends StatefulWidget {
  final String title;
  const ChooseScreen4({super.key, required this.title});

  @override
  State<ChooseScreen4> createState() => _ChooseScreen4();
}

class _ChooseScreen4 extends State<ChooseScreen4> {
  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index

  late RegistrationProvider registrationProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
  }

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
              "Your Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: ScreemHight * 0.32,
            child: Container(
              // height: ScreemHight * 0.4,
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
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      GlobalVariabels.vertical5,
                      // const Text(
                      //   "Agonda",
                      //   style: TextStyle(color: Colors.black, fontSize: 20),
                      // ),
                      GlobalVariabels.vertical5,
                      const Text(
                        "Address",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      GlobalVariabels.vertical5,
                      Text(
                        registrationProvider.addressController.text,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // const Text(
                      //   "Lorem Ipsum has been the industry's standard dummy text ever since nknown printer took a galley of type and scrambled it to make",
                      //   style: TextStyle(color: Colors.black, fontSize: 12),
                      // ),
                      SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: SizedBox(
                          width: ScreenWidth * 0.3,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 95, 39),
                              )),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const ChooseScreen5();
                                }));
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
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

class MyButtonGroup extends StatelessWidget {
  final int selectedButtonIndex;
  final Function(int) onButtonPressed;

  const MyButtonGroup(
      {super.key,
      required this.selectedButtonIndex,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MyButton(
            index: index,
            selectedIndex: selectedButtonIndex,
            onPressed: onButtonPressed,
          ),
        );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function(int) onPressed;

  MyButton(
      {required this.index,
      required this.selectedIndex,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          index == selectedIndex ? GlobalVariabels.appColor : Colors.white,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      onPressed: () {
        onPressed(index);
      },
      child: const Text(
        "NGO",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
