import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/group_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupsViewModel extends FutureViewModel<List<GroupModel>?> {
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();

  openGroupDetail(int groupId) {
    _navService.navigateTo(Routes.groupDetailsView,
        arguments: GroupDetailViewArguments(groupId: groupId));
  }

  List<GroupModel> groupList = [];
  @override
  void onData(List<GroupModel>? data) {
    super.onData(data);
    if (data != null) {
      groupList.addAll(data);
    }
  }

  @override
  Future<List<GroupModel>?> futureToRun() {
    return _userService.getGroup();
  }
}
