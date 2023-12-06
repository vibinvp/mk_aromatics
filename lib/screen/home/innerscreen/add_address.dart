import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            GlobalVariabels.vertical40,
            SizedBox(
              height: 50,
              child: TextField(
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
                decoration: InputDecoration(
                    hintText: "State",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            GlobalVariabels.vertical15,
            GlobalVariabels.vertical40,
            // PrimaryButton(onTap: () {}, label: "Add Address")
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalVariabels.appColor),
                onPressed: () {},
                child: const Text(
                  "Add Address",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
