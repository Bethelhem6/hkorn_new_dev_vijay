import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/council_memebers_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class CouncilMembersVoteViewModel
    extends FutureViewModel<List<CouncilMembersModel>?> {
  final _userService = locator<UserService>();

  List<CouncilMembersModel> councilMembers = [];

  @override
  void onData(List<CouncilMembersModel>? data) {
    super.onData(data);
    if (data != null) {
      councilMembers.addAll(data);
    }
  }

  @override
  Future<List<CouncilMembersModel>?> futureToRun() {
    return _userService.getCouncilMembers();
  }
}
