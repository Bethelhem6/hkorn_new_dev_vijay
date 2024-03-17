import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/cart_list_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends FutureViewModel<List<CartListModel>?> {
  // int count = 1;
  Map count = {};
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  List<CartListModel> cartItems = [];

  void navigateToCheckOut() {
    _navService.navigateTo(Routes.checkOutView);
  }

  void incCount() {
    // count++;
    notifyListeners();
  }

  void decCount() {
    // if (count == 1) {
    //   return;
    // }
    // count--;
    notifyListeners();
  }

  @override
  void onData(List<CartListModel>? data) {
    super.onData(data);
    if (data != null) {
      cartItems.addAll(data);
      for (var element in data) {
        count.addAll({element.product_id: 1});
      }
    }
  }

  @override
  Future<List<CartListModel>?> futureToRun() {
    return _userService.getUserCart();
  }
}
