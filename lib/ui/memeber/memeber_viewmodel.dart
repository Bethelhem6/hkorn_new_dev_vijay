import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/council_memebers_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class MembersViewModel extends FutureViewModel<List<CouncilAllMemberModel>?> {
  final _userService = locator<UserService>();

  List<CouncilAllMemberModel> councilMembers = [];

  @override
  void onData(List<CouncilAllMemberModel>? data) {
    super.onData(data);
    if (data != null) {
      for (var element in data) {
        if (element.isActive) {
          councilMembers.add(element);
        }
      }
    }
  }

  @override
  Future<List<CouncilAllMemberModel>?> futureToRun() {
    return _userService.getCouncilAllMemberDetails();
  }
}
