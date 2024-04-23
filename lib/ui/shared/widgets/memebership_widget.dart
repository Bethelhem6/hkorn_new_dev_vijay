// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:ui_helper/ui_helper.dart';

class MembershipWidget extends StatelessWidget {
  const MembershipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? 210
          : MediaQuery.of(context).size.height / 3.05,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(Images.card),
          fit: BoxFit.cover,
        ),
        color: BaseColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Text(
              "APPLICATION FOR ORDINARY, AFFILIATED OR RETIRED MEMBERSHIP?",
              textAlign: TextAlign.left,
              style: BaseFonts.headline(color: BaseColors.white, fontSize: 14),
            ),
            verticalSpaceSmall,
            Text(
              "Membership shall be awarded to persons who have outstanding achievement, or whose work has reached a level of excellence in nursing or in Operating Room services and who are recommended by the Council of the Association.",
              textAlign: TextAlign.left,
              style: BaseFonts.footNote2(color: BaseColors.white, fontSize: 11),
            ),
            verticalSpaceSmall,
            Container(
              height: 40,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: BaseColors.white,
              ),
              child: Center(
                child: Text(
                  "MEMBERSHIP NOW",
                  textAlign: TextAlign.left,
                  style: BaseFonts.headline(
                      color: BaseColors.primaryColor, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
