import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/council_memebers/council_memebers_vote_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class CouncilMembersVoteView extends StatelessWidget {
  const CouncilMembersVoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CouncilMembersVoteViewModel>.reactive(
      viewModelBuilder: () => CouncilMembersVoteViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Council Voting",
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Council Member 2020 - 2022",
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
                                image: model.councilMembers[index].image,
                                context: context);
                          }),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget memberTile(
      {required String title,
      required String image,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
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
          ExtendedImage.network(
            image,
            height: 80.0,
            fit: BoxFit.scaleDown,
            width: 80.0,
            shape: BoxShape.circle,
          ),
          Text(
            title,
            style: BaseFonts.subHeadBold(color: BaseColors.primaryColor),
          ),
          verticalSpaceTiny,
        ],
      ),
    );
  }
}
