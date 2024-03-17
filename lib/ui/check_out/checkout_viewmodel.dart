import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckOutViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController townDistrict = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController orderNote = TextEditingController();

  void navigateToCheckOut() {
    _navService.navigateTo(Routes.orderConfirmationView);
  }
}
