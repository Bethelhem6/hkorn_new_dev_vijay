import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/model/popup_data_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel {
  final _navService = locator<NavigationService>();
  int activeIndex = 0;
  int currentPage = 0;
  List<PopupData> popUpDataList = [];
  final _userService = locator<UserService>();
  final List<String> imageList = [
    "assets/images/slider1_new.png",
    'assets/images/slider3_new.png',
    'assets/images/slider2_new.png',
    'assets/images/OR01.jpg',
    "assets/images/PYNEH-1.jpg"
  ];

  final List<String> icons = [
    Images.newspaper,
    Images.planner,
    Images.mission,
    Images.usefulLink,
    Images.group,
    Images.gallery
  ];

  List<String> titles = [
    'News',
    'Events',
    'Mission',
    'Useful Links',
    'Member Zone',
    'Gallery'
  ];

  final List<Color> cardColors = [
    const Color(0xFF329BCC),
    const Color(0xFF5F5F5F),
    const Color(0xFF6AA151),
    const Color(0xFFC65927),
    const Color(0xFFFFBD41),
    const Color(0xFF2878B1),
  ];

  void navigateToNotification() {
    _navService.navigateTo(Routes.notificationView);
  }

  goToAbout() {
    logger.d('message');
    _navService.navigateTo(Routes.aboutView);
  }

  goToEventList() {
    _navService.navigateTo(Routes.eventView);
  }

  goToConstitution() {
    _navService.navigateTo(Routes.constitutionView);
  }

  goToChairperson() {
    _navService.navigateTo(Routes.chairpersonView);
  }

  goToMembershipConsil() {
    _navService.navigateTo(Routes.memberCouncilView);
  }

  goToCourses() {
    _navService.navigateTo(Routes.courseView);
  }

  goToNews() {
    _navService.navigateTo(Routes.newsView);
  }

  goToRenewal() {
    _navService.navigateTo(Routes.renewalView);
  }

  goToGallery() {
    _navService.navigateTo(Routes.galleryView);
  }

  goToUsefulLinks() {
    _navService.navigateTo(Routes.usefulLinks);
  }

  goToMemebers() {
    _navService.navigateTo(Routes.membersView);
  }

  goToForum() {
    _navService.navigateTo(Routes.forumsView);
  }

  goToVoting() {
    _navService.navigateTo(Routes.councilMembersVoteView);
  }

  goToAccountSetting() {
    _navService.navigateTo(Routes.accountSettingView);
  }

  goToContact() {
    _navService.navigateTo(Routes.contactFormView);
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
