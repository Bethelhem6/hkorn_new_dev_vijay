import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../model/add_to_cart_model.dart';

class NewMemberShipViewModel extends FutureViewModel {
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();
  List<AddToCartDataModel> addCartItems = [];
  int count = 1;

  void navigateToHome() {
    _userService.addToCartData(count);
    _navService.navigateTo(Routes.mainView);
  }

  void incCount() {
    count++;
    notifyListeners();
  }

  @override
  void onData(data) {
    super.onData(data);
  }

  @override
  Future futureToRun() {
    throw UnimplementedError();
  }
}
