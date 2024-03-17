import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/account_setting/account_setting_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import '../../const/consts.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSettingViewModel>.reactive(
        viewModelBuilder: () => AccountSettingViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: "Account Setting",
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15),
                    //   child: HorizontalScrollableItems(
                    //     items: model.items,
                    //     onTap: () {},
                    //   ),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          Text(
                            "Login Information",
                            style: BaseFonts.headline(
                                fontSize: 16,
                                color: BaseColors.black.withOpacity(0.7)),
                          ),
                          verticalSpaceMedium,
                          verticalSpaceSmall,
                          const BaseTextField(
                              hintText: 'demo', label: 'Current Password'),
                          verticalSpaceTiny,
                          Text(
                            "required to update email or change current password",
                            style: BaseFonts.subHead(color: BaseColors.green),
                          ),
                          verticalSpaceSmall,
                          const BaseTextField(
                              hintText: '******',
                              label: 'Add your new password'),
                          const BaseTextField(
                              hintText: '******',
                              label: 'Repeat your new password'),
                          verticalSpaceLarge,
                          verticalSpaceSmall,
                          Button(
                            textColor: BaseColors.white,
                            text: "Save Changes",
                            onPressed: () => () {},
                          ),
                          verticalSpaceLarge,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
