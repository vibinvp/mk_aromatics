import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen3.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen4.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen5.dart';
import 'package:provider/provider.dart';

class ChooseScreen2 extends StatefulWidget {
  const ChooseScreen2({super.key, required this.name});
  final String name;
  @override
  State<ChooseScreen2> createState() => _ChooseScreen2();
}

class _ChooseScreen2 extends State<ChooseScreen2> {
  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index

  late RegistrationProvider registrationProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    registrationProvider.getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registrationProvider.getSubcategoryList(context);
    });
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
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
                child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            )),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: ScreemHight * 0.34,
            child: Container(
              //  height: MediaQuery.of(context).size.height / 2,
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: MyButtonGroup(),
                ),
              ),
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
  const MyButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, value, _) {
        return value.isLoadSubCategory
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: value.subcategoryList.length,
                itemBuilder: (BuildContext context, index) {
                  final cat = value.subcategoryList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyButton(
                      index: index,
                      onPressed: () async {
                        value.selectedSubCategory(cat.id.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChooseScreen4(
                              title: cat.subCatName ?? "",
                            ),
                          ),
                        );
                      },
                      title: cat.subCatName ?? '',
                    ),
                  );
                },
              );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final int index;
  final void Function()? onPressed;

  MyButton({required this.index, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.grey.shade300,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
