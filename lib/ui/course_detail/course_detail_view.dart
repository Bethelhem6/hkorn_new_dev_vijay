import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/course_detail/coursedetail_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class CourseDetailView extends StatelessWidget {
  final String courseId;

  const CourseDetailView({Key? key, required this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseDetailViewModel>.reactive(
        viewModelBuilder: () => CourseDetailViewModel(courseId),
        builder: (context, model, child) => Scaffold(
              appBar: BaseAppbar(
                context: context,
                title: 'Courses Details',
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpaceSmall,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 172,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: BaseImage(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            url: model
                                                    .courseDetailModel?.image ??
                                                ''),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: Container(
                                          width: 57,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFFBD41),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "FREE",
                                              style: BaseFonts.subHead(
                                                  fontSize: 11,
                                                  color: BaseColors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'PERIOPERATIVE NURSING',
                                        style: BaseFonts.subHead(
                                            fontSize: 12,
                                            color: BaseColors.textTitle),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '08.10.2021 – 10.12.2021',
                                        style: BaseFonts.subHead(
                                            fontSize: 12,
                                            color: BaseColors.primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  model.courseDetailModel?.title ?? '',
                                  style: BaseFonts.subHeadBold(
                                      fontSize: 14, color: BaseColors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      getIconButton(
                                          context, Images.lessons, '9 Lessons'),
                                      getIconButton(
                                          context, Images.topics, '18 Topics'),
                                      getIconButton(
                                          context, Images.quiz, '1 Quiz'),
                                      getIconButton(context, Images.certificate,
                                          'Course\nCertificate'),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1.0,
                                  color: BaseColors.borderBoxColor,
                                ),
                                Row(
                                  children: [
                                    Button(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      textsize: 10,
                                      borderRadius: BorderRadius.circular(50.0),
                                      width: 83,
                                      height: 32,
                                      text: 'Course',
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Button(
                                      backgroundColor: Colors.transparent,
                                      border: Border.all(
                                          color: BaseColors.borderBoxColor),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      textsize: 10,
                                      width: 83,
                                      height: 32,
                                      borderRadius: BorderRadius.circular(50.0),
                                      text: 'Material',
                                      textColor: BaseColors.textColor,
                                    )
                                  ],
                                ),
                                Html(
                                  data: model.courseDetailModel?.description ??
                                      '',
                                  style: {
                                    "table": Style(
                                      alignment: Alignment.centerLeft,
                                      backgroundColor: Colors.white,
                                    ),
                                    "tr": Style(
                                      border: const Border(
                                          bottom:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    "th": Style(
                                      backgroundColor: Colors.grey,
                                    ),
                                    "td": Style(
                                      alignment: Alignment.topLeft,
                                    ),
                                    'h5': Style(
                                        maxLines: 2,
                                        textOverflow: TextOverflow.ellipsis),
                                    'h2': Style(
                                      fontSize: FontSize(16.0),
                                      color: BaseColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    'h3': Style(
                                      fontSize: FontSize(16.0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    'p': Style(
                                        fontSize: FontSize(12.0),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.80)),
                                    'li': Style(
                                        fontSize: FontSize(12.0),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.80)),
                                    'ol': Style(
                                        fontSize: FontSize(12.0),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.80)),
                                    'u': Style(
                                      fontSize: FontSize(16.0),
                                      color: BaseColors.black.withOpacity(0.70),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  },
                                ),
                              ],
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.all(0.0),
                            elevation: 5.0,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.groupImage,
                                        width: 20.0,
                                        height: 20.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        '+75 enrolled',
                                        style: BaseFonts.subHead(
                                            fontSize: 12,
                                            color: BaseColors.textTitle),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 5.0),
                                  child: Button(
                                    text: 'Enroll',
                                  ),
                                ),
                                verticalSpaceMedium
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ));
  }

  Widget getIconButton(BuildContext context, String image, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 44,
      decoration: BoxDecoration(
          border: Border.all(color: BaseColors.borderBoxColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 12.0,
            width: 12.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: BaseFonts.subHead(
                fontSize: 10, color: BaseColors.black.withOpacity(0.80)),
          )
        ],
      ),
    );
  }
}
