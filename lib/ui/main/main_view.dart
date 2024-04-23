import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkorn_new_dev_vijay/ui/main/main_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:stacked/stacked.dart';

import '../shared/base_fonts.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        builder: (context, model, child) => Scaffold(
              body: model.pages[model.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: model.currentIndex,
                onTap: model.onTap,
                // fixedColor: BaseColors.white,
                selectedItemColor: BaseColors.primaryColor,
                unselectedItemColor: BaseColors.labelColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: BaseColors.white,
                elevation: 0,
                items: [
                  const BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(CupertinoIcons.house_fill),
                  ),
                  BottomNavigationBarItem(
                    label: 'Notification',
                    icon: Stack(
                      children: [
                        const Icon(
                          // onPressed: () => model.navigateToNotification(),
                          CupertinoIcons.bell_fill, size: 35,
                        ),
                        model.popUpDataList.isNotEmpty
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: BaseColors.redColor,
                                  child: Text(
                                    '${model.popUpDataList.length}',
                                    style: BaseFonts.headline2(
                                            color: BaseColors.white,
                                            fontSize: 12)
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  // BottomNavigationBarItem(
                  //   label: 'My Cart',
                  //   icon: Icon(CupertinoIcons.cart_fill),
                  // ),
                  // BottomNavigationBarItem(
                  //   label: 'Message',
                  //   icon: Icon(CupertinoIcons.mail_solid),
                  // ),
                  const BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(CupertinoIcons.person_solid),
                  ),
                ],
              ),
            ));
  }
}
