import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

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
                            icon: Icon(Icons.arrow_back)),
                      ],
                    ),
                    SizedBox(
                      height: ScreemHight * 0.1,
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
                        // height: ScreemHight * .45,
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
  @override
  _WasteManagementDropdownState createState() =>
      _WasteManagementDropdownState();
}

class _WasteManagementDropdownState extends State<WasteManagementDropdown> {
  String selectedCategory = 'Plastic';
  List<String> selectedSubCategories = [];

  Map<String, List<String>> wasteCategories = {
    'Plastic': [
      'Post Consumer ',
      'Post Consumer - MSW',
      'Industrial Plastic',
      'Thermocol'
    ],
    'Biodegradable': [
      ' Green garbage ',
      'food waste',
      'biodegradable plastics '
    ],
    'Paper': ['Recyclable Paper', 'Non-Recyclable Paper', 'Cardboard'],
    'Industrial Waste': ['Cafeteria refuse', 'dirt and gravel', 'scrap metals'],
  };

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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(
                  Icons.check,
                  color: GlobalVariabels.appColor,
                ),
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                    selectedSubCategories = [];
                  });
                },
                items: wasteCategories.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        GlobalVariabels.vertical10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: wasteCategories[selectedCategory]!.map((subCategory) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: CheckboxListTile(
                    //checkColor: GlobalVariabels.appColor,
                    activeColor: GlobalVariabels.appColor,

                    title: Center(
                      child: Text(
                        subCategory,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    value: selectedSubCategories.contains(subCategory),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          selectedSubCategories.add(subCategory);
                        } else {
                          selectedSubCategories.remove(subCategory);
                        }
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
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
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "   KG"),
                ),
              ),
            ],
          ),
        ),
        GlobalVariabels.vertical10,
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                //offset: Offset(2, 2),
              ),
            ],
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_a_photo_outlined,
                size: 45,
              )),
        ),
        GlobalVariabels.vertical10,
        PrimaryButton(onTap: () {}, label: "Submit"),
        GlobalVariabels.vertical15
      ],
    );
  }
}

class approximate extends StatelessWidget {
  const approximate({
    super.key,
    required this.ScreemHight,
  });

  final double ScreemHight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Approximate Weight  ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              )),
          Container(
            height: ScreemHight * 0.05,
            color: Colors.grey.shade300,
            child: TextField(
              decoration: InputDecoration(hintText: "KG"),
            ),
          )
        ],
      ),
    );
  }
}

// class WasteManagementDropdown extends StatefulWidget {
//   @override
//   _WasteManagementDropdownState createState() =>
//       _WasteManagementDropdownState();
// }

// class _WasteManagementDropdownState extends State<WasteManagementDropdown> {
//   String selectedCategory = 'Plastics';
//   String selectedSubCategory = 'Post Consumer Segregated';

//   Map<String, List<String>> wasteCategories = {
//     'Plastics': [
//       'Post Consumer Segregated',
//       'Post Consumer - MSW',
//       'Industrial Plastic',
//       'Thermocol'
//     ],
//     'Biodegradable': ['Category A', 'Category B', 'Category C'],
//     'Paper': ['Recyclable Paper', 'Non-Recyclable Paper', 'Cardboard'],
//     'Industrial Waste': ['Category X', 'Category Y', 'Category Z'],
//   };

//   @override
//   Widget build(BuildContext context) {
//     final ScreemHight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GlobalVariabels.vertical15,
//         GlobalVariabels.vertical15,
//         Container(
//           width: ScreenWidth * 0.7,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 3.0,
//                 offset: Offset(2, 2),
//               ),
//             ],
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 icon: const Icon(
//                   Icons.check,
//                   color: GlobalVariabels.appColor,
//                 ),
//                 value: selectedCategory,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedCategory = newValue!;
//                     selectedSubCategory = wasteCategories[selectedCategory]![0];
//                   });
//                 },
//                 items: wasteCategories.keys
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ),
//         GlobalVariabels.vertical10,
//         Container(
//           width: ScreenWidth * 0.7,
//           decoration: BoxDecoration(color: Colors.grey.shade400),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: DropdownButton<String>(
//               value: selectedSubCategory,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedSubCategory = newValue!;
//                 });
//               },
//               items: wasteCategories[selectedCategory]!
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
