import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/profile/profile_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: "Profile",
                automaticallyImplyLeading: false,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : ListView(
                      padding:
                          const EdgeInsets.symmetric(horizontal: sidePadding),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ExtendedImage.network(
                                model.userModel?.user_image ?? '',
                                shape: BoxShape.circle,
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                              horizontalSpaceSmall,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.userModel!.display_name.toString(),
                                    style: BaseFonts.subHeadBold(),
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    model.userModel!.user_email.toString(),
                                    style: BaseFonts.subHead(
                                        fontSize: 12,
                                        color: BaseColors.greyColor),
                                  ),
                                  Text(
                                    ' Joined 2022',
                                    style: BaseFonts.subHead(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Child tile of drawer with specified title
                        verticalSpaceSmall,
                        tiles(
                            title: 'Account Settings',
                            onTap: model.openAccountSetting,
                            context: context),
                        // const Divider(),
                        // tiles(title: 'Timeline', onTap: () {}, context: context),
                        // const Divider(),

                        // tiles(
                        //     title: 'Notifications',
                        //     onTap: model.openNotications,
                        //     context: context),
                        const Divider(),

                        tiles(
                            title: 'Messages', onTap: () {}, context: context),
                        const Divider(),

                        // tiles(title: 'Connections', onTap: () {}, context: context),
                        // const Divider(),

                        tiles(
                            title: 'Groups',
                            onTap: model.openGroups,
                            context: context),
                        const Divider(),

                        tiles(
                            title: 'Courses',
                            onTap: model.openCourse,
                            context: context),
                        const Divider(),

                        tiles(
                            title: 'Forums',
                            onTap: model.openForums,
                            context: context),
                        const Divider(),

                        tiles(
                            title: 'Photos',
                            onTap: model.openPhotos,
                            context: context),
                        const Divider(),

                        // tiles(
                        //     title: 'Email Invites',
                        //     onTap: () {},
                        //     context: context),
                        // const Divider(),

                        tiles(
                            title: 'Logout',
                            onTap: model.logout,
                            context: context),
                        verticalSpaceMedium,
                      ],
                    ),
            ));
  }

  Widget tiles(
      {required String title,
      required Function onTap,
      required BuildContext context}) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: BaseFonts.headline(
            fontSize: 17,
            color: title == 'Logout' ? BaseColors.redColor : BaseColors.black),
      ),
      onTap: () => onTap(),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
