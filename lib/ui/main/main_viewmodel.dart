import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/popup_data_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/ui/home/home_view.dart';
import 'package:hkorn_new_dev_vijay/ui/profile/profile_view.dart';
// import 'package:hkorn_new_dev_vijay/ui/search/search_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../notification_page/notification_page_view.dart';

class MainViewModel extends FutureViewModel {
  int currentIndex = 0;
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<PopupData> popUpDataList = [];
  void navigateToNotification() {
    _navService.navigateTo(Routes.notificationView);
  }

  List<Widget> pages = const [
    HomeView(),
    NotificationView(),
    // SearchView(),
    // CartView(),
    // MessageView(),
    ProfileView()
  ];

  void onTap(int index) async {
    currentIndex = index;
    notifyListeners();
  }

  void setIndex() async {
    currentIndex = 0;
    notifyListeners();
  }

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      popUpDataList.addAll(data);
    }
  }

  @override
  Future futureToRun() {
    return _userService.getPopUpData();
  }
}
