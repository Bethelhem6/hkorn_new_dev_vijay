import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/groups/groups_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupsViewModel>.reactive(
      viewModelBuilder: () => GroupsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Groups",
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 36,
                        width: 133,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: BaseColors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: const Color(0xffE2DFDF))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Recently Active",
                              style: BaseFonts.headline2().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: BaseColors.black),
                            ),
                            const Icon(Icons.arrow_drop_down_sharp,
                                color: BaseColors.primaryColor)
                          ],
                        ),
                      ),
                    ),
                    verticalSpaceRegular,
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: model.groupList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.90,
                                crossAxisCount: 2,
                                crossAxisSpacing: sidePadding,
                                mainAxisSpacing: sidePadding),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => model.openGroupDetail(
                                model.groupList[index].groups_id),
                            child: Container(
                              // height: 185,
                              width: 161,
                              decoration: BoxDecoration(
                                  color: BaseColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        blurRadius: 6.23,
                                        offset: const Offset(0, 4.76),
                                        color:
                                            BaseColors.black.withOpacity(0.10)),
                                  ],
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 90,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0)),
                                          child: Image.network(
                                              model.groupList[index]
                                                  .group_image_url,
                                              height: 64,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover),
                                        ),
                                        model.groupList[index].status ==
                                                'private'
                                            ? Positioned(
                                                top: 43.0,
                                                left: 55.0,
                                                child: Image.asset(
                                                    Images.yellowCircle,
                                                    width: 46))
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                  model.groupList[index].status == 'private'
                                      ? Text(
                                          "Private Group",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff222222)),
                                        )
                                      : Text(
                                          ".",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.transparent),
                                        ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        model.groupList[index].groups_title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: BaseFonts.headline2().copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: BaseColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "1024",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 15.02,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff222222)),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "Members",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 7.51,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff555555)),
                                        ),
                                        const Spacer(),
                                        Image.asset(Images.groupImage,
                                            height: 15),
                                      ],
                                    ),
                                  ),
                                  verticalSpaceSmall
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
