import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import 'photo_detail_viewmodel.dart';

class PhotoDetailView extends StatelessWidget {
  final List<String> photo;
  final String galleryTitle;

  const PhotoDetailView(
      {Key? key, required this.photo, required this.galleryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoDetailPageViewModel>.reactive(
        viewModelBuilder: () => PhotoDetailPageViewModel(photo, galleryTitle),
        builder: (context, model, child) => Scaffold(
              appBar: BaseAppbar(
                color: BaseColors.primaryColor,
                context: context,
                title: model.photoTitle,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : SingleChildScrollView(
                      padding:
                          const EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            carouselController: model.carouselController,
                            itemCount: model.photo.length,
                            options: CarouselOptions(
                              // enlargeCenterPage: true,
                              onPageChanged: (index, reason) {},
                              height: 300,
                              autoPlayInterval: const Duration(seconds: 3),
                              reverse: false,
                              aspectRatio: 1.0,
                              viewportFraction: 1,
                              disableCenter: true,
                            ),
                            itemBuilder: (context, i, id) {
                              return Stack(
                                children: [
                                  Align(
                                      child: BaseImage(
                                    url: model.photo[i],
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 140),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            model.carouselController
                                                .previousPage();
                                          },
                                          child: const CircleAvatar(
                                            child: Icon(
                                              Icons.west,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            model.carouselController.nextPage();
                                          },
                                          child: const CircleAvatar(
                                            child: Icon(
                                              Icons.east,
                                              size: 30,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),

                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(vertical: 22.0),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "PERIOPERATIVE NURSING",
                          //         style: BaseFonts.headline2().copyWith(
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w500,
                          //             color: BaseColors.textTitle),
                          //       ),
                          //       const Spacer(),
                          //       Text(
                          //         "08.10.2021 – 10.12.2021",
                          //         style: BaseFonts.headline2().copyWith(
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w500,
                          //             color: BaseColors.primaryColor),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     ClipRRect(
                          //         borderRadius: BorderRadius.circular(25),
                          //         child: Image.network(
                          //           model.photoDetailModel?.getAvatarUrl ??
                          //               '',
                          //           width: 46,
                          //           height: 46,
                          //           fit: BoxFit.fill,
                          //         )),
                          //     horizontalSpaceSmall,
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           model.photoDetailModel?.authorImage ?? '',
                          //           style: BaseFonts.headline2().copyWith(
                          //               fontSize: 12.69,
                          //               fontWeight: FontWeight.w600,
                          //               color: const Color(0xff374151)),
                          //         ),
                          //         Text(
                          //           model.photoDetailModel?.postDate != null
                          //               ? FormatIOS8601Time().castToDateTime(
                          //                   model.photoDetailModel?.postDate
                          //                           ?.toIso8601String() ??
                          //                       '')['month_date_time']
                          //               : '',
                          //           style: BaseFonts.headline2().copyWith(
                          //               fontSize: 12.69,
                          //               fontWeight: FontWeight.w600,
                          //               color: const Color(0xff374151)),
                          //         ),
                          //       ],
                          //     )
                          //   ],
                          // ),
                          // const Padding(
                          //   padding: EdgeInsets.only(top: 8.0),
                          //   child: Divider(
                          //     thickness: 1.0,
                          //     color: BaseColors.dividor,
                          //   ),
                          // ),
                          // verticalSpaceSmall,
                          // Text(
                          //   "RECENT POSTS",
                          //   style: BaseFonts.headline2().copyWith(
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600,
                          //       color: BaseColors.black.withOpacity(0.80)),
                          // ),
                          // verticalSpaceSmall,
                          // Container(
                          //   height: 225,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: BaseColors.border),
                          //       borderRadius: BorderRadius.circular(8.0)),
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       ClipRRect(
                          //         borderRadius: BorderRadius.circular(4.0),
                          //         child: Image.asset(Images.course,
                          //             height: 146,
                          //             width:
                          //                 MediaQuery.of(context).size.width,
                          //             fit: BoxFit.cover),
                          //       ),
                          //       const SizedBox(
                          //         height: 12.0,
                          //       ),
                          //       Text(
                          //         "2019 PONC",
                          //         style: BaseFonts.headline2().copyWith(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w600,
                          //             color: BaseColors.primaryColor),
                          //       ),
                          //       const SizedBox(
                          //         height: 3.0,
                          //       ),
                          //       Row(
                          //         children: [
                          //           Text(
                          //             "PERIOPERATIVE NURSING",
                          //             style: BaseFonts.headline2().copyWith(
                          //                 fontSize: 12,
                          //                 fontWeight: FontWeight.w500,
                          //                 color: BaseColors.textTitle),
                          //           ),
                          //           const Spacer(),
                          //           const Icon(Icons.calendar_month_rounded,
                          //               color: Color(0xff626262), size: 8.5),
                          //           horizontalSpaceSmall,
                          //           Text(
                          //             "Thursday, 22 Augus 2020",
                          //             style: BaseFonts.headline2().copyWith(
                          //                 fontSize: 8.15,
                          //                 fontWeight: FontWeight.w300,
                          //                 color: const Color(0xff050152)),
                          //           ),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
            ));
  }
}
