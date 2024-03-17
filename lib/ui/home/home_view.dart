import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/home/home_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import '../../const/consts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        drawer: Drawer(
          //ListView to listdown children of drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //Drawer header for Heading part of drawer
              verticalSpaceCustom(height: 65),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'H K O R N',
                      style: GoogleFonts.podkova(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      'The Association of Hong Kong Operating \nRoom Nurses (HKORN)',
                      style: TextStyle(fontSize: 12, color: BaseColors.black),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              //Child tile of drawer with specified title
              ExpansionTile(
                title: Text('About HKORN',
                    style: BaseFonts.headline(fontSize: 16)),
                children: <Widget>[
                  ListTile(
                      onTap: model.goToAbout,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      title: Text('Mission of the Association',
                          style: BaseFonts.headline(fontSize: 15).copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff374151)))),
                  ListTile(
                      onTap: model.goToConstitution,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      title: Text('Constitution',
                          style: BaseFonts.headline(fontSize: 15).copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff374151)))),
                  ListTile(
                      onTap: model.goToChairperson,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      title: Text('Message from Chairperon',
                          style: BaseFonts.headline(fontSize: 15).copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff374151)))),
                  ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      dense: true,
                      onTap: model.goToMembershipConsil,
                      visualDensity: VisualDensity.compact,
                      title: Text('Council Member ',
                          style: BaseFonts.headline(fontSize: 15).copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff374151)))),
                ],
              ),
              tiles(
                  title: 'Event', onTap: model.goToEventList, context: context),

              tiles(
                  title: 'Course', onTap: model.goToCourses, context: context),

              tiles(title: 'News', onTap: model.goToNews, context: context),

              // tiles(
              //     title: 'Event List',
              //     onTap: model.goToRenewal,
              //     context: context),
              // tiles(
              //     title: 'Council Vote',
              //     onTap: model.goToVoting,
              //     context: context),
              tiles(
                  title: 'Gallery', onTap: model.goToGallery, context: context),

              // tiles(title: 'Forum', onTap: model.goToForum, context: context),

              tiles(
                  title: 'Useful Link',
                  onTap: model.goToUsefulLinks,
                  context: context),

              tiles(
                  title: 'Members',
                  onTap: model.goToMemebers,
                  context: context),

              tiles(title: 'Notes', onTap: () {}, context: context),

              tiles(
                  title: 'Contact', onTap: model.goToContact, context: context),

              tiles(
                  title: 'Account',
                  onTap: model.goToAccountSetting,
                  context: context),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BaseColors.white,
          iconTheme: const IconThemeData(color: BaseColors.primaryColor),
          titleSpacing: 0,
          title: Row(
            children: [
              Image.asset(Images.black_logo,
                  height: 40.0, fit: BoxFit.scaleDown, width: 40.0),
              Text(
                  "The Association of Hong Kong \nOperating Room Nurses (HKORN)",
                  textAlign: TextAlign.start,
                  style: BaseFonts.headline(fontSize: 12)),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () => model.navigateToNotification(),
                    icon: const Icon(CupertinoIcons.bell_fill, size: 35),
                    color: BaseColors.black,
                  ),
                  model.popUpDataList.isNotEmpty
                      ? Positioned(
                          right: 10,
                          top: 2,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: BaseColors.redColor,
                            child: Text(
                              '${model.popUpDataList.length}',
                              style: BaseFonts.headline2(
                                      color: BaseColors.white, fontSize: 12)
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: sidePadding, right: sidePadding, top: 25),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: model.imageList.length,
                  options: CarouselOptions(
                    // enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      model.currentPage = index;
                    },
                    height: 160,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 1.0,
                    viewportFraction: 1,
                    disableCenter: true,
                  ),
                  itemBuilder: (context, i, id) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(model.imageList[i],
                          width: MediaQuery.of(context).size.width -
                              (sidePadding * 2),
                          fit: BoxFit.cover),
                    );
                  },
                ),
                // verticalSpaceSmall,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(
                //     model.imageList.length,
                //         (index) => AnimatedContainer(
                //           duration: const Duration(milliseconds: 300),
                //           margin: const EdgeInsets.only(right: 5),
                //           height: 8,
                //           width: 8,
                //           decoration: BoxDecoration(
                //             color: model.currentPage == index ? Colors.black : Colors.white,
                //             border: Border.all(
                //                 color: model.currentPage == index ? Colors.black : Color(0xffE2E2E2)),
                //             borderRadius: BorderRadius.circular(6),
                //           ),
                //         ),
                //   ),
                // ),
                verticalSpaceMedium,
                gridView(
                    images: model.icons,
                    titles: model.titles,
                    colors: model.cardColors,
                    model: model)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slider(List imageList, HomeViewModel? model) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          options: CarouselOptions(
            // enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              model?.currentPage = index;
            },
            height: 148,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            reverse: false,
            aspectRatio: 1.0,
            viewportFraction: 1,
            disableCenter: true,
          ),
          itemBuilder: (context, i, id) {
            return GestureDetector(
              onTap: () {
                // var url = imageList[i];
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageList[i],
                    width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget gridView(
      {required List<String> titles,
      required List<Color> colors,
      required List<String> images,
      required HomeViewModel model}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 120, // here set custom Height You Want
      ),
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if (titles[index] == 'News') {
              model.goToNews();
            } else if (titles[index] == 'Events') {
              model.goToEventList();
            } else if (titles[index] == 'Mission') {
              model.goToAbout();
            } else if (titles[index] == 'Useful Links') {
              model.goToUsefulLinks();
            } else if (titles[index] == 'Member Zone') {
              model.goToMemebers();
            } else if (titles[index] == 'Gallery') {
              model.goToGallery();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colors[index],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(images[index],
                    height: 40.0, fit: BoxFit.scaleDown, width: 40.0),
                verticalSpaceSmall,
                Text(titles[index].toString(),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BaseFonts.headline2(color: BaseColors.white)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tiles(
      {required String title,
      required Function onTap,
      required BuildContext context}) {
    return ListTile(
      title: Text(
        title,
        style: BaseFonts.headline(fontSize: 16),
      ),
      onTap: () => onTap(),
    );
  }
}
