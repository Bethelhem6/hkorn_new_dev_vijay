import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class MessageDetailViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  @override
  void onData(data) {
    super.onData(data);
  }

  @override
  Future futureToRun() {
    return _userService.getUserMessageList();
  }
}
