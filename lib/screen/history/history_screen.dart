import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/history/history.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryController historyController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    historyController = Provider.of<HistoryController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      historyController.getHistoryList(context);
    });
  }

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
              child: Consumer<HistoryController>(
                  builder: (context, HistoryController value, _) {
                return value.isLoadCategory
                    ? Center(
                        child: ShimmerEffect(),
                      )
                    : value.historyList.isEmpty
                        ? Center(
                            child: Text("No History Found"),
                          )
                        : ListView.builder(
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
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.history,
                                        size: 40,
                                        color: GlobalVariabels.appColor,
                                      ),
                                      GlobalVariabels.horizontal10,
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value
                                                  .historyList[index].wasteTypes
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              value.historyList[index]
                                                      .subWaste ??
                                                  "",
                                              maxLines: 4,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GlobalVariabels.horizontal10,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            value.historyList[index].orderStatus
                                                        .toString() ==
                                                    '1'
                                                ? 'Accepted'
                                                : 'Rejected',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: value.historyList[index]
                                                            .orderStatus ==
                                                        '1'
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                          Text(
                                            "KG ${value.historyList[index].weight.toString()}",
                                            style: TextStyle(),
                                          ),
                                          Text(
                                            value.historyList[index].reqDate
                                                .toString(),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: value.historyList.length);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
