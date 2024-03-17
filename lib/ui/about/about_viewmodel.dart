import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/about_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class AboutViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  List<AboutModel> mission = [];

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      mission.addAll(data);
    }
  }

  @override
  Future futureToRun() {
    return _userService.getAboutDetails();
  }
}
