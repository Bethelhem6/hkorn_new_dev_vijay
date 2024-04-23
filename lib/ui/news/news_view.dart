import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/news/news_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/memebership_widget.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/news_new.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      viewModelBuilder: () => NewsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: 'News',
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : Column(
                children: [
                  model.newsList.isEmpty
                      ? Center(
                          child: Text(
                            "No News Found",
                            style: BaseFonts.headline2(),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemCount: model.newsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return index == 5
                                    ? Column(
                                        children: [
                                          NewsNewTile(
                                            context: context,
                                            title: model
                                                .newsList[index].news_title,
                                            url: model.newsList[index].images,
                                            onTap: () {
                                              model.openNews(model
                                                  .newsList[index].news_id);
                                            },
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: MembershipWidget())
                                        ],
                                      )
                                    : NewsNewTile(
                                        context: context,
                                        url: model.newsList[index].images,
                                        title: model.newsList[index].news_title,
                                        onTap: () {
                                          model.openNews(
                                              model.newsList[index].news_id);
                                        },
                                      );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  height: 1,
                                  color: BaseColors.white,
                                );
                              }),
                        ),
                ],
              ),
      ),
    );
  }
//
// Widget bubbleOnCard(String title, Function onTap) {
//   return Container(
//       height: 30,
//       width: 65,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0), color: BaseColors.white),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: () => onTap(),
//             child: Text(title,
//                 style: BaseFonts.caption(color: BaseColors.primaryColor)),
//           ),
//         ],
//       ));
// }
//
// Widget newsTile(
//     BuildContext context, String url, Function newsTap, Function noteTap) {
//   return Container(
//     margin: EdgeInsets.all(10.0),
//     height: MediaQuery.of(context).size.height / 3.3,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Stack(
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: BaseImage(
//                 width: MediaQuery.of(context).size.width,
//                 url: url,
//                 height: MediaQuery.of(context).size.height / 4,
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   bubbleOnCard(
//                     'NEWS',
//                     newsTap,
//                   ),
//                   horizontalSpaceTiny,
//                   bubbleOnCard('NOTE', noteTap),
//                 ],
//               ),
//             ),
//             Positioned(
//                 bottom: 10,
//                 left: 10,
//                 right: 10,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8.0, right: 10),
//                   child: Text(
//                     "Certificate Course in Perioperative Nursing (Class 15)",
//                     textAlign: TextAlign.left,
//                     style: BaseFonts.subHeadBold(
//                         color: BaseColors.white, fontSize: 14),
//                   ),
//                 ))
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "SUM KIN BARRY LO",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: BaseColors.primaryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12),
//               ),
//               Text(
//                 "2018-08-21",
//                 textAlign: TextAlign.center,
//                 style: BaseFonts.caption(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
