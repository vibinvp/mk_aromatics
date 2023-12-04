import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text("History"),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      //width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.history,
                              size: 40,
                              color: GlobalVariabels.appColor,
                            ),
                            GlobalVariabels.horizontal10,
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Lorem Ipsum has bee a gall It has survived not",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "Lorem Ipsum has bee a gall It has survived not only five centuries, but also Ipsum has bee a gall It has survived not only five centuri the",
                                    maxLines: 4,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            GlobalVariabels.horizontal10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10.00 AM",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "05-07-2023",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10),
            ),
          ),
        ),
      ],
    );
  }
}
