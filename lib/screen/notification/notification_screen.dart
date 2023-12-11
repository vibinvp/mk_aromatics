import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/controller/notification/notificatoncoontroller.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationController notificationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationController =
        Provider.of<NotificationController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notificationController.getnotification(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text("Notification"),
          ),
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/MK-Aromatic-BG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child:
                  Consumer(builder: (context, NotificationController value, _) {
                return ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return value.isLoading
                          ? const Center(
                              child: ShimmerEffect(),
                            )
                          : value.notifications.isEmpty
                              ? const Center(
                                  child: Text("No Notifcations"),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      title: Text(
                                          value.notifications[index].title ??
                                              ""),
                                      subtitle: Text(
                                          value.notifications[index].message ??
                                              ""),
                                    ),
                                  ),
                                );
                    },
                    itemCount: value.notifications.length);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
