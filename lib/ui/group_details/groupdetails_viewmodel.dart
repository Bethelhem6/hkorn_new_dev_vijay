import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/group_member_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupDetailViewModel extends FutureViewModel {
  final navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final int groupId;

  GroupDetailViewModel(this.groupId);

  GroupMemberModel? groupMemberModel;
  @override
  void onData(data) {
    super.onData(data);
    groupMemberModel = data;
  }

  @override
  Future futureToRun() {
    Map<String, dynamic> data = {"group_id": groupId};
    return _userService.getGroupDetailData(data);
  }
}
