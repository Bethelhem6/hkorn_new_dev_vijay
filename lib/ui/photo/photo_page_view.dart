import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:hkorn_new_dev_vijay/util/format_time.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import 'photo_page_viewmodel.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoPageViewModel>.reactive(
        viewModelBuilder: () => PhotoPageViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: "Gallery",
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: model.currentIndex,
              //   onTap: model.onTap,
              //   // fixedColor: BaseColors.white,
              //   selectedItemColor: BaseColors.primaryColor,
              //   unselectedItemColor: BaseColors.labelColor,
              //   showSelectedLabels: true,
              //   showUnselectedLabels: true,
              //   type: BottomNavigationBarType.fixed,
              //   backgroundColor: BaseColors.white,
              //   elevation: 0,
              //   items: const [
              //     BottomNavigationBarItem(
              //       label: 'Home',
              //       icon: Icon(CupertinoIcons.house_fill),
              //     ),
              //     BottomNavigationBarItem(
              //       label: 'Search',
              //       icon: Icon(CupertinoIcons.search),
              //     ),
              //     BottomNavigationBarItem(
              //       label: 'My Cart',
              //       icon: Icon(CupertinoIcons.cart_fill),
              //     ),
              //     BottomNavigationBarItem(
              //       label: 'Message',
              //       icon: Icon(CupertinoIcons.mail_solid),
              //     ),
              //     BottomNavigationBarItem(
              //       label: 'Profile',
              //       icon: Icon(CupertinoIcons.person_solid),
              //     ),
              //   ],
              // ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Photos",
                                  style: BaseFonts.headline2().copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                horizontalSpaceSmall,
                                Container(
                                  width: 40,
                                  height: 21,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFBD41),
                                      borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${model.photoList.length}",
                                    style: BaseFonts.headline2().copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(Images.filter,
                                    width: 16, height: 16)
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              width: 211,
                              height: 94,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text(
                                      "2021 AGM dinner",
                                      style: BaseFonts.headline2().copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff006863)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        minRadius: 17.0,
                                        maxRadius: 17.0,
                                        backgroundImage:
                                            AssetImage(Images.test_user),
                                      ),
                                      horizontalSpaceSmall,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Shomitro Kumar",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 8.56,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Colors.grey.shade700),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "@Bishal",
                                                style: BaseFonts.headline2()
                                                    .copyWith(
                                                        fontSize: 7.49,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff4F5E7B)),
                                              ),
                                              Text(
                                                "• Joined May 2022",
                                                style: BaseFonts.headline2()
                                                    .copyWith(
                                                        fontSize: 7.49,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpaceSmall,
                            GridView.builder(
                              itemCount: model.photoList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.75,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 17.0,
                                      mainAxisSpacing: 15.0),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    model.openPhotoDetail(
                                        model.photoList[index].photo_id);
                                  },
                                  child: Container(
                                    // width: 163,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: const Color(0xffAAAAAA))),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                          child: BaseImage(
                                            url: model
                                                .photoList[index].photo_images,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 124,
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 5.0, right: 5.0),
                                          child: Text(
                                            model.photoList[index].photo_title,
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xff006863)),
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              BaseImage(
                                                url: model.photoList[index]
                                                    .get_avatar_url,
                                                width: 28,
                                                height: 28,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model.photoList[index]
                                                        .author_image,
                                                    style: BaseFonts.headline2()
                                                        .copyWith(
                                                            fontSize: 7.55,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xff374151)),
                                                  ),
                                                  Text(
                                                    FormatIOS8601Time()
                                                            .castToDateTime(model
                                                                .photoList[index]
                                                                .post_date
                                                                .toIso8601String())[
                                                        'month_date_time'],
                                                    style: BaseFonts.headline2()
                                                        .copyWith(
                                                            fontSize: 7.55,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xff374151)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        const SizedBox(height: 1.0)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            verticalSpaceMedium
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
