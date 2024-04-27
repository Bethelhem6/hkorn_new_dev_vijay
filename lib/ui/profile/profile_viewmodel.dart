import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/user_model.dart';
import 'package:hkorn_new_dev_vijay/service/auth_service.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel<UserModel?> {
  final _navService = locator<NavigationService>();
  final _sharedService = locator<SharedPrefService>();
  final _authService = locator<AuthService>();
  UserModel? userModel;
  bool loaded = false;

  logout() async {
    await _sharedService.clearStored();
    _navService.clearStackAndShow(Routes.startUpView);
  }

  @override
  void onData(UserModel? data) {
    super.onData(data);
    if (data != null) {
      userModel = data;
      loaded = true;
      logger.d(userModel!.toMap());
      notifyListeners();
    }
  }

  @override
  Future<UserModel?> futureToRun() {
    return _authService.getUserInfo();
  }

  openCourse() {
    _navService.navigateTo(Routes.courseView);
  }

  openAccountSetting() {
    _navService.navigateTo(Routes.accountSettingView);
  }

  openForums() {
    _navService.navigateTo(Routes.forumsView);
  }

  openGroups() {
    _navService.navigateTo(Routes.groupView);
  }

  openPhotos() {
    _navService.navigateTo(Routes.galleryView);
  }

  openNotications() {
    _navService.navigateTo(Routes.notificationView);
  }
}
