import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/bubble.dart';
import 'package:ui_helper/ui_helper.dart';

class NewsNewTile extends StatelessWidget {
  final BuildContext context;
  final String url;
  final Function()? onTap;
  final String boxOneText;
  final String boxTwoText;
  final String title;

  const NewsNewTile({
    Key? key,
    required this.context,
    required this.url,
    this.boxTwoText = 'Notes',
    this.boxOneText = 'News',
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? 210
          : MediaQuery.of(context).size.height / 3.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: BaseImage(
                  // width: MediaQuery.of(context).size.width,
                  fit: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? BoxFit.contain
                      : BoxFit.fill,
                  url: url,
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 200
                      : MediaQuery.of(context).size.height / 4,
                  onTap: onTap,
                ),
              ),
              Positioned(
                top: 10,
                right:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.width * 0.30
                        : 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bubble(title: boxOneText, onTap: null),
                    horizontalSpaceTiny,
                    Bubble(title: boxTwoText, onTap: null),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.25
                      : 10,
                  right: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.25
                      : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: BaseFonts.subHeadBold(
                          color: BaseColors.white, fontSize: 14),
                    ),
                  ))
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         "SUM KIN BARRY LO",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             color: BaseColors.primaryColor,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 12),
          //       ),
          //       Text(
          //         "2018-08-21",
          //         textAlign: TextAlign.center,
          //         style: BaseFonts.caption(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
