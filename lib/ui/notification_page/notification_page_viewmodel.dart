import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/notification_model.dart';
import 'package:hkorn_new_dev_vijay/model/popup_data_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  List<NotificationModel> notifications = [];
  List<PopupData> popUpDataList = [];

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
