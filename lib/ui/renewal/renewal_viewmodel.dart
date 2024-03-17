import 'package:another_flushbar/flushbar_helper.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/event_model.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RenewalViewModel extends FutureViewModel<List<EventModelForPurchase>?> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _sharedService = locator<SharedPrefService>();
  final _key = StackedService.navigatorKey!;
  List<EventModelForPurchase> events = [];

  @override
  void onData(List<EventModelForPurchase>? data) {
    super.onData(data);
    if (data != null) {
      events.addAll(data);
    }
  }

  void navigateToDetail() {
    _navService.navigateTo(Routes.renewalDetailView);
  }

  addToBasket(int productId, int quantity) async {
    setBusy(true);
    Map data = await _sharedService.getStoredData();
    Map<String, dynamic> item = {
      'user_id': data['idl'],
      'product_id': productId,
      'quantity': quantity
    };
    Map? addToCart = await _userService.addToCart(item);
    if (addToCart != null) {
      FlushbarHelper.createSuccess(message: 'Item has been added to cart')
          .show(_key.currentContext!);
    } else {
      FlushbarHelper.createError(message: 'Failed Adding to cart')
          .show(_key.currentContext!);
    }
    setBusy(false);
  }

  @override
  Future<List<EventModelForPurchase>?> futureToRun() {
    return _userService.getEventsForPurchase();
  }
}
