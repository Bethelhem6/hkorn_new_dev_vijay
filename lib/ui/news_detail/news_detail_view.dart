import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/news_detail/news_detail_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/bubble.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class NewsDetailView extends StatelessWidget {
  final int newsId;

  const NewsDetailView({Key? key, required this.newsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsDetailViewModel>.reactive(
      viewModelBuilder: () => NewsDetailViewModel(newsId),
      builder: (context, model, child) => Scaffold(
        appBar: BaseAppbar(
          context: context,
          title: "News Details",
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : model.newsModel == null
                ? const Center(
                    child: Text("Error Fetching News."),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            children: [
                              BaseImage(
                                url: model.newsModel!.image,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                              ),
                              verticalSpaceMedium,
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20, // Image radius
                                    backgroundImage:
                                        AssetImage(Images.test_user),
                                    // NetworkImage('imageUrl'),
                                  ),
                                  horizontalSpaceSmall,
                                  Expanded(
                                    child: Text(
                                      model.newsModel!.title.toString(),
                                      style: BaseFonts.subHeadBold(
                                          fontSize: 14,
                                          color: BaseColors.primaryColor),
                                    ),
                                  ),
                                  // const Spacer(),
                                  // Text(
                                  //   "2018-08-21",
                                  //   style: BaseFonts.footNote2(fontSize: 14),
                                  // ),
                                  horizontalSpaceSmall,
                                ],
                              ),
                              // Container(
                              //   padding: const EdgeInsets.only(
                              //     right: 20,
                              //   ),
                              //   width: MediaQuery.of(context).size.width,
                              //   child: Text(
                              //     "Certificate Course in Perioperative Nursing (Class 15)",
                              //     textAlign: TextAlign.start,
                              //     style: BaseFonts.headline(fontSize: 16),
                              //   ),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   "Dear Members",
                                    //   textAlign: TextAlign.left,
                                    //   style: BaseFonts.footNote2(),
                                    // ),
                                    verticalSpaceSmall,
                                    // Text(
                                    //   model.newsModel!.description,
                                    //   textAlign: TextAlign.left,
                                    //   style: BaseFonts.footNote2(),
                                    // ),
                                    Html(data: model.newsModel!.description),
                                  ],
                                ),
                              ),
                              verticalSpaceMedium,
                              const Divider(
                                height: 1,
                                color: BaseColors.black,
                              ),
                              verticalSpaceMedium,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //     height: 150,
                                  //     width: 150,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(color:BaseColors.primaryColor)
                                  //     ),
                                  //     child: Icon(Icons.picture_as_pdf,size: 100,),
                                  //   ),
                                  // ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: BaseColors.primaryColor,
                                  //       border: Border.all(
                                  //           color: BaseColors.primaryColor),
                                  //       borderRadius:
                                  //           BorderRadius.circular(10.0)),
                                  //   child: const Padding(
                                  //     padding: EdgeInsets.all(10.0),
                                  //     child: Text(
                                  //       "Download [408.62 KB]",
                                  //       textAlign: TextAlign.center,
                                  //       style: TextStyle(
                                  //           color: BaseColors.white,
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 12),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                              verticalSpaceMedium,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Categories",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 14),
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    children: [
                                      Bubble(
                                        title: 'News',
                                        onTap: () {},
                                        showBorder: true,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  Text(
                                    "Tagged",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 14),
                                  ),
                                  verticalSpaceSmall,
                                  Bubble(
                                    title: 'Course',
                                    onTap: () {},
                                    showBorder: true,
                                  ),
                                  verticalSpaceMedium,
                                  Text(
                                    "Share on",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 14),
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    children: [
                                      shareWidget(
                                          const Color(0xff2C67DB), 'Facebook'),
                                      horizontalSpaceSmall,
                                      shareWidget(
                                          const Color(0xff388DE3), 'Twitter'),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  // Text(
                                  //   "Related Articles",
                                  //   textAlign: TextAlign.left,
                                  //   style: BaseFonts.subHeadBold(
                                  //       color: BaseColors.black,
                                  //       fontSize: 14),
                                  // ),
                                ],
                              ),

                              // related()
                            ],
                          ),
                        ),
                        // ListView.separated(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: 5,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return NewsTile(
                        //         context: context,
                        //         url: model.url[index],
                        //         title: '',
                        //         newsTap: () {},
                        //         noteTap: () {});
                        //   },
                        //   separatorBuilder:
                        //       (BuildContext context, int index) {
                        //     return const Divider(
                        //       height: 1,
                        //       color: BaseColors.white,
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget shareWidget(Color color, String title) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  BaseFonts.subHeadBold(color: BaseColors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
