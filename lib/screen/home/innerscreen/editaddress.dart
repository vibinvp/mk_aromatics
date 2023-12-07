import 'package:flutter/material.dart';

import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/add%20address/add_address_controller.dart';
import 'package:mk_aromatic_limited/controller/edit%20address/edit_address.dart';
import 'package:mk_aromatic_limited/model/getAddress.dart/getaddress_model.dart';
import 'package:provider/provider.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key, required this.address});
  final GetAddressList address;
  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late EditAddressController editAddressController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editAddressController =
        Provider.of<EditAddressController>(context, listen: false);
    editAddressController.nameController.text = widget.address.name ?? '';
    editAddressController.addressController.text = widget.address.address ?? '';
    editAddressController.areaController.text = widget.address.area ?? '';
    editAddressController.pincodeController.text = widget.address.pincode ?? '';
    editAddressController.cityController.text = widget.address.city ?? '';
    editAddressController.stateController.text = widget.address.state ?? '';
    editAddressController.mobileController.text = widget.address.mobile ?? '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Address"),
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
                  controller: editAddressController.nameController,
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
                  controller: editAddressController.addressController,
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
                  controller: editAddressController.areaController,
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
                  controller: editAddressController.pincodeController,
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
                  controller: editAddressController.cityController,
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
                  controller: editAddressController.stateController,
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
                  controller: editAddressController.mobileController,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              GlobalVariabels.vertical15,
              GlobalVariabels.vertical40,
              // PrimaryButton(onTap: () {}, label: "Add Address")
              Consumer(builder: (context, EditAddressController value, _) {
                return value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalVariabels.appColor),
                        onPressed: () {
                          value.editAddress(context, widget.address.id);
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
