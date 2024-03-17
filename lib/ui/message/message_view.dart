import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/ui/message/message_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

String timeAgo(DateTime d) {
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365) {
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  }
  if (diff.inDays > 30) {
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  }
  if (diff.inDays > 7) {
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  }
  if (diff.inDays > 0) {
    return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
  }
  if (diff.inHours > 0) {
    return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
  }
  if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  }
  return "Now";
}

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
        viewModelBuilder: () => MessageViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: 'Message',
                automaticallyImplyLeading: false,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor:
                                  const Color(0xFFE5E7EB).withOpacity(0.2),
                              enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Search here ',
                            ),
                          ),
                        ),
                        Expanded(
                          child: model.messages.isEmpty
                              ? Center(
                                  child: Text(
                                    "No message has been found",
                                    style: BaseFonts.subHeadBold(),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: model.messages.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        model.navService.navigateTo(
                                            Routes.messageDetailView);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10.0),
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                0.5,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          // decoration: BoxDecoration(
                                          //   borderRadius:
                                          //       BorderRadius.circular(10.0),
                                          //   color: model.messages[index]
                                          //               .unread_count !=
                                          //           0
                                          //       ? const Color(0xFFEBFBF7)
                                          //       : const Color(0xFFF9FAFB),
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ExtendedImage.network(
                                                    model.messages[index]
                                                        .sender_image,
                                                    shape: BoxShape.circle,
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  // Positioned(
                                                  //   bottom: 10,
                                                  //   right: 3,
                                                  //   child: Container(
                                                  //     width: 14,
                                                  //     height: 14,
                                                  //     decoration: BoxDecoration(
                                                  //         color: Colors.green,
                                                  //         shape: BoxShape.circle,
                                                  //         border: Border.all(
                                                  //             color: BaseColors
                                                  //                 .white,
                                                  //             width: 2)),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Html(
                                                    data: model.messages[index]
                                                        .message,
                                                    shrinkWrap: true,
                                                    style: {
                                                      'p': Style(
                                                          fontSize:
                                                              FontSize(14),
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          maxLines: 1,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              BaseColors.black),
                                                    }),
                                              ),
                                              horizontalSpaceTiny,
                                              Text(
                                                  timeAgo(DateTime.parse(model
                                                      .messages[index]
                                                      .date_sent)),
                                                  textAlign: TextAlign.center,
                                                  style: BaseFonts.subHead(
                                                      fontSize: 12))
                                              // Expanded(
                                              //   child: Column(
                                              //     mainAxisAlignment: MainAxisAlignment.start,
                                              //     crossAxisAlignment: CrossAxisAlignment.start,
                                              //     children: [
                                              //       verticalSpaceTiny,
                                              //       Row(
                                              //         mainAxisAlignment: MainAxisAlignment.start,
                                              //         crossAxisAlignment: CrossAxisAlignment.start,
                                              //         children: [
                                              //           verticalSpaceSmall,
                                              //           Text("Now",
                                              //               textAlign: TextAlign.center,
                                              //               style: BaseFonts.subHead(fontSize: 14)),
                                              //         ],
                                              //       ),
                                              //       verticalSpaceTiny,
                                              //       // Row(
                                              //       //   children: [
                                              //       //
                                              //       //     // Expanded(
                                              //       //     //   child: Text(
                                              //       //     //     model.messages[index].message,
                                              //       //     //     maxLines: 1,
                                              //       //     //     overflow: TextOverflow.ellipsis,
                                              //       //     //     textAlign: TextAlign.left,
                                              //       //     //     style:
                                              //       //     //         BaseFonts.subHead(color: BaseColors.black, fontSize: 14),
                                              //       //     //   ),
                                              //       //     // ),
                                              //       //     // index == 0
                                              //       //     //     ? Container(
                                              //       //     //         height: 20,
                                              //       //     //         width: 20,
                                              //       //     //         decoration: BoxDecoration(
                                              //       //     //             color: BaseColors.primaryColor,
                                              //       //     //             borderRadius: BorderRadius.circular(100)
                                              //       //     //             //more than 50% of width makes circle
                                              //       //     //             ),
                                              //       //     //         child: Center(
                                              //       //     //           child: Text(
                                              //       //     //               model.messages[index].unread_count.toString(),
                                              //       //     //               textAlign: TextAlign.left,
                                              //       //     //               style: const TextStyle(
                                              //       //     //                   color: BaseColors.white, fontSize: 14)),
                                              //       //     //         ),
                                              //       //     //       )
                                              //       //     //     : Container(),
                                              //       //   ],
                                              //       // ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Container();
                                  }),
                        ),
                      ],
                    ),
            ));
  }
}
