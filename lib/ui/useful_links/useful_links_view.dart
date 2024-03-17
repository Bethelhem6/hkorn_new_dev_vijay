import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/links_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:ui_helper/ui_helper.dart';

import '../../const/consts.dart';

class UsefulLinks extends StatefulWidget {
  const UsefulLinks({Key? key}) : super(key: key);

  @override
  State<UsefulLinks> createState() => _UsefulLinksState();
}

class _UsefulLinksState extends State<UsefulLinks> {
  final _userService = locator<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppbar(
        context: context,
        title: "Useful Link",
      ),
      body: FutureBuilder(
        future: _userService.getLinks(),
        builder:
            (BuildContext context, AsyncSnapshot<List<LinksModel>?> snapshot) {
          logger.d(snapshot.data);
          if (snapshot.data == null) {
            return Center(
              child: loadingSpinnerWidget,
            );
          }
          List<Widget> titles = [];

          for (var element in snapshot.data!) {
            titles.add(Html(
              data: element.description,
              style: {
                "a": Style(
                    fontSize: FontSize(16.0),
                    fontWeight: FontWeight.w500,
                    color: BaseColors.primaryColor),
                "h1": Style(
                    fontSize: FontSize(16.0),
                    fontWeight: FontWeight.w400,
                    color: BaseColors.black),
                "h3": Style(
                    fontSize: FontSize(0.0),
                    fontWeight: FontWeight.w400,
                    color: BaseColors.white),
              },
            ));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding - 6),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return titles[index];
                  },
                ),
                verticalSpaceLarge,
              ],
            ),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10.0, right: 25),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           "All Useful Links",
      //           textAlign: TextAlign.left,
      //           style: BaseFonts.headline(fontSize: 16),
      //         ),
      //         verticalSpaceMedium,
      //         Padding(
      //           padding: const EdgeInsets.only(left: 15.0),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               textTile("Master of Science in Perioperative Nursing "
      //                   "course conducted by The Chinese University of"
      //                   " Hong Kong The Nethersole School of Nursing"),
      //               textTile('Association of Hong Kong Nursing Staff'),
      //               textTile('Hong Kong Academy of Nursing'),
      //               textTile('Hospital Authority'),
      //               textTile(
      //                   'The Chinese University of Hong Kong The Nethersole School of Nursing'),
      //               textTile('School of Nursing, HKU'),
      //               textTile(
      //                   'The Hong Kong Polytechnic University School of Nursing'),
      //               textTile('Hong Kong Infection Control Nurses Association'),
      //               textTile(
      //                   'Hong Kong Association of Critical Care Nurses Ltd'),
      //               textTile(
      //                   'Association of periOperative Registered Nurses (AORN)'),
      //               textTile(
      //                   'American Society of PeriAnesthesia Nurse (ASPAN)'),
      //               verticalSpaceLarge,
      //               const MembershipWidget(),
      //               verticalSpaceLarge,
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget textTile(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: BaseColors.primaryColor,
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Text(
              title,
              style: BaseFonts.subHead(
                  underLine: true, color: BaseColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
