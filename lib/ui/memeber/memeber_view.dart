import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/memeber/memeber_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/memebership_widget.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import '../../const/consts.dart';

class MembersView extends StatelessWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MembersViewModel>.reactive(
      viewModelBuilder: () => MembersViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "All Member",
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest joined Member",
                      style: BaseFonts.headline2(fontSize: 14),
                    ),
                    verticalSpaceMedium,
                    ListView.builder(
                        itemCount: model.councilMembers.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return memberTile(
                              title: model.councilMembers[index].name,
                              hospital: 'hospital',
                              location: '',
                              context: context);
                        }),
                    verticalSpaceLarge,
                    const MembershipWidget(),
                    verticalSpaceLarge,
                  ],
                ),
              ),
      ),
    );
  }

  Widget memberTile(
      {required String title,
      required String hospital,
      required String location,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: BaseColors.borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BaseFonts.subHeadBold(color: BaseColors.primaryColor),
          ),
          // verticalSpaceTiny,
          // Text(
          //   hospital,
          //   style: BaseFonts.footNote2(color: BaseColors.greyColor),
          // ),
          // Text(
          //   location,
          //   style: BaseFonts.footNote2(color: BaseColors.greyColor),
          // )
        ],
      ),
    );
  }
}

// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
// memberTile(
// context: context,
// title: "MS. CHAN Sui Han, Rachel",
// hospital: "Queen Elizabeth Hospital",
// location: "ChairPerson"),
