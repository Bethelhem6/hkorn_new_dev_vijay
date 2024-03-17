import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/event_detail/event_detail_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/event_detail/pdfview.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class EventDetailView extends StatelessWidget {
  final int eventID;
  const EventDetailView({Key? key, required this.eventID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventDetailViewModel>.reactive(
      viewModelBuilder: () => EventDetailViewModel(eventID),
      builder: (context, model, child) => Scaffold(
        appBar: BaseAppbar(
          title: "Event Details",
          context: context,
        ),
        body: model.isBusy
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: loadingSpinnerWidget,
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 15,
                      left: sidePadding,
                      right: sidePadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topics(
                        title: model.eventDetailModel?.title ?? '',
                        subtitle: model.eventDetailModel?.subtitle ?? '',
                        date: DateFormat.yMMMM().format(
                            model.eventDetailModel?.eventDatetime ??
                                DateTime.now()),
                        location: model.eventDetailModel?.location ?? '',
                      ),
                      Html(data: model.htmlData),
                      model.pdfUrl.isNotEmpty
                          ? GestureDetector(
                              onTap: () async {
                                // launchUrl(Uri.parse(model.pdfUrl.substring(2)),
                                //     mode: LaunchMode
                                //         .externalNonBrowserApplication);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CustomPdfView(
                                            pdfPath: model.pdfUrl)));
                              },
                              child: Card(
                                color: const Color(0xffFAFAFA),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Row(children: [
                                    Image.asset(
                                      'assets/images/pdf_icon.png',
                                      width: 35,
                                      height: 25,
                                    ),
                                    Text(model.pdfUrl.split('/').last)
                                  ]),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget topics(
      {required title,
      required subtitle,
      required String date,
      required String location,
      bool showDivider = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: const Color(0xffFAFAFA),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Icon(Icons.schedule, size: 20),
                    ),
                    horizontalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'TIME',
                          style: BaseFonts.headline(),
                        ),
                        Text(date,
                            style:
                                const TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Icon(Icons.location_on, size: 20),
                    ),
                    horizontalSpaceSmall,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOCATION', style: BaseFonts.headline()),
                        Text(location,
                            style:
                                const TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalSpaceSmall,
        Text(
          title,
          style: BaseFonts.headline(),
        ),
        verticalSpaceSmall,
        Text(
          subtitle,
          textAlign: TextAlign.left,
          style: BaseFonts.headline2(fontSize: 15),
        ),
      ],
    );
  }

  // Widget qrCode(BuildContext context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           QrImage(
  //             padding: EdgeInsets.zero,
  //             data:
  //                 "https://us06web.zooms.us/webinar/register/WN_VPj4pqDMRYapOJxsJyYH_g",
  //             version: QrVersions.auto,
  //             size: 75.0,
  //           ),
  //           horizontalSpaceMedium,
  //           Expanded(
  //             child: GestureDetector(
  //               child: SizedBox(
  //                 width: MediaQuery.of(context).size.width / 1.38,
  //                 child: const Text(
  //                     "https://us06web.zooms.us/webinar/register/WN_VPj4pqDMRYapOJxsJyYH_g",
  //                     maxLines: null,
  //                     textAlign: TextAlign.start,
  //                     style: TextStyle(
  //                         decoration: TextDecoration.underline,
  //                         color: Colors.blue)),
  //               ),
  //               onTap: () async {
  //                 const url =
  //                     'https://us06web.zooms.us/webinar/register/WN_VPj4pqDMRYapOJxsJyYH_g';
  //                 // ignore: deprecated_member_use
  //                 if (await canLaunch(url)) launch(url);
  //               },
  //             ),
  //           )
  //         ],
  //       ),
  //       verticalSpaceMedium,
  //       Text(
  //         "Dr. NG Yuen Ting, Rebecca (CONs, NS, PWH) Dr. NG Yuen Ting, Rebecca (CONs, NS, PWH)",
  //         textAlign: TextAlign.left,
  //         style: BaseFonts.subHead(fontSize: 14),
  //       ),
  //       const Divider(
  //         thickness: 2,
  //       ),
  //     ],
  //   );
  // }
}
