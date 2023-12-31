import 'package:flutter/material.dart';

import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/add%20address/add_address_controller.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late AdddAddressController adddAddressController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adddAddressController =
        Provider.of<AdddAddressController>(context, listen: false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GlobalVariabels.vertical40,
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adddAddressController.nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adddAddressController.addressController,
                  decoration: InputDecoration(
                      hintText: "Flat, House no, Building, Company, Apartment",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adddAddressController.areaController,
                  decoration: InputDecoration(
                      hintText: "Area, Street, Sector, Village",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,

              SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: adddAddressController.pincodeController,
                  decoration: InputDecoration(
                      hintText: "Pincode",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adddAddressController.cityController,
                  decoration: InputDecoration(
                      hintText: "Towm/City",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adddAddressController.stateController,
                  decoration: InputDecoration(
                      hintText: "State",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: adddAddressController.mobileController,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              GlobalVariabels.vertical40,
              // PrimaryButton(onTap: () {}, label: "Add Address")
              Consumer(builder: (context, AdddAddressController value, _) {
                return value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalVariabels.appColor),
                        onPressed: () {
                          value.addAddress(context);
                        },
                        child: const Text(
                          "Add Address",
                          style: TextStyle(color: Colors.white),
                        ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
