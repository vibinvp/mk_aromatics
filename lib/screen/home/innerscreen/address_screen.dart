import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/controller/remove%20address/remove_address.dart';
import 'package:mk_aromatic_limited/controller/waste%20pickup/pickup.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/add_address.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/editaddress.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    super.key,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late GetAddressController getAddressController;
  late RemoveAddressController removeAddressController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddressController =
        Provider.of<GetAddressController>(context, listen: false);
    getAddressController =
        Provider.of<GetAddressController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAddressController.geAddress(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 25,
        backgroundColor: GlobalVariabels.appColor,
        child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddAddressScreen();
              }));
            },
            icon: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            )),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          "My Address",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: Consumer<GetAddressController>(
                  builder: (context, GetAddressController value, _) {
                return value.isLoadCategory
                    ? const Center(
                        child: ShimmerEffect(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: value.addressList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer(
                                builder: (context, ProfileController data, _) {
                              return GestureDetector(
                                onTap: () {
                                  data.setSelectAdrres(
                                      value.addressList[index].address ?? '',
                                      value.addressList[index].id ?? "");
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  //height: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.grey.shade100),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              value.addressList[index].name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  child: ElevatedButton(
                                                      style: const ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors.grey)),
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return EditAddressScreen(
                                                            address: value
                                                                    .addressList[
                                                                index],
                                                          );
                                                        }));
                                                      },
                                                      child: const Text("Edit",
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .black))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Consumer(builder: (context,
                                                    RemoveAddressController
                                                        remove,
                                                    _) {
                                                  final addressId = value
                                                      .addressList[index].id;
                                                  return SizedBox(
                                                    height: 20,
                                                    child: ElevatedButton(
                                                        style: const ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    Colors
                                                                        .grey)),
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Are You Sure?'),
                                                                content: const Text(
                                                                    'Do you want to remove?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      remove.removeAddress(
                                                                          context,
                                                                          addressId);
                                                                    },
                                                                    child: const Text(
                                                                        'Remove'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: const Text(
                                                          "Remove",
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      101,
                                                                      38,
                                                                      38)),
                                                        )),
                                                  );
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          value.addressList[index].address ??
                                              "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.addressList[index].area ?? "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.addressList[index].city ?? "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.addressList[index].state ?? "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.addressList[index].pincode ??
                                              "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.addressList[index].mobile ?? "",
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        });
              }),
            )
          ],
        ),
      ),
    );
  }
}
