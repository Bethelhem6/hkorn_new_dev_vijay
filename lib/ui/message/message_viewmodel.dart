import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/messages_list.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MessageViewModel extends FutureViewModel<List<MessageListModel>?> {
  final userService = locator<UserService>();
  final navService = locator<NavigationService>();
  List<MessageListModel> messages = [];

  @override
  void onData(List<MessageListModel>? data) {
    super.onData(data);
    if (data != null) {
      messages.addAll(data);
    }
  }

  @override
  Future<List<MessageListModel>?> futureToRun() {
    return userService.getUserMessageList();
  }
}
