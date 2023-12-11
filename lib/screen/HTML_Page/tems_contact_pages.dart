import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mk_aromatic_limited/common/shimmer_effect.dart';
import 'package:mk_aromatic_limited/constants/color_constant.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/appSetting/appsettingcontroller.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsHtmlView extends StatefulWidget {
  const TermsAndConditionsHtmlView(
      {super.key, required this.title, required this.code});

  final String title;
  final String code;
  @override
  State<TermsAndConditionsHtmlView> createState() =>
      _TermsAndConditionsHtmlViewState();
}

class _TermsAndConditionsHtmlViewState
    extends State<TermsAndConditionsHtmlView> {
  late AppsettingController settingController;
  bool camera = false;
  @override
  void initState() {
    settingController =
        Provider.of<AppsettingController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      settingController.appSettingdetails(context);
    });
    super.initState();
  }

//==============================================================================
//============================= Build Method ===================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GlobalVariabels.appColor,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<AppsettingController>(
        builder: (context, value, child) {
          return value.isLoadingappsetting
              ? const Center(
                  child: CircularProgressIndicator(
                    color: GlobalVariabels.appColor,
                  ),
                )
              : value.appsetting.isEmpty
                  ? const Center(
                      child: Text('No Data'),
                    )
                  : SingleChildScrollView(
                      child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: HtmlWidget(
                          widget.code == 'P'
                              ? value.appsetting[0].privatePolicy ??
                                  'No Details Found!'
                              : widget.code == 'F'
                                  ? value.appsetting[0].faq ??
                                      'No Details Found!'
                                  : widget.code == 'T'
                                      ? value.appsetting[0].termsCondition ??
                                          'No Details Found!'
                                      : widget.code == 'C'
                                          ? value.appsetting[0].contactUs ??
                                              'No Details Found!'
                                          : 'No Details Found!',
                          onErrorBuilder: (context, element, error) =>
                              Text('$element error: $error'),
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const SizedBox(
                            height: 600,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: GlobalVariabels.appColor,
                              ),
                            ),
                          ),

                          onTapUrl: (url) {
                            launchUrl(Uri.parse(url));
                            return true;
                          },

                          renderMode: RenderMode.column,

                          // set the default styling for text
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ]));
        },
      ),
    );
  }
}
