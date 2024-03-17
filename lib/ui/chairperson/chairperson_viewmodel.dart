import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/chairperson_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class ChairPersonViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  List<String> list = <String>[
    '2006 - 2008',
    '2010 - 2012',
    '2012 - 2016',
    '2016 - 2020',
    '2020 - 2022'
  ];
  String dropdownValue = '2020 - 2022';

  ChairPersonModel? chairPersonModel;

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      chairPersonModel = data;
    }
  }

  @override
  Future futureToRun() {
    Map<String, dynamic> model = {"key": "2020"};
    return _userService.getChairPersonMessageDetail(model);
  }
}
