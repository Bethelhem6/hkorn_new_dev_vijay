import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/main/main_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:stacked/stacked.dart';

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
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(CupertinoIcons.house_fill),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: Icon(CupertinoIcons.search),
                  ),
                  // BottomNavigationBarItem(
                  //   label: 'My Cart',
                  //   icon: Icon(CupertinoIcons.cart_fill),
                  // ),
                  // BottomNavigationBarItem(
                  //   label: 'Message',
                  //   icon: Icon(CupertinoIcons.mail_solid),
                  // ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(CupertinoIcons.person_solid),
                  ),
                ],
              ),
            ));
  }
}
