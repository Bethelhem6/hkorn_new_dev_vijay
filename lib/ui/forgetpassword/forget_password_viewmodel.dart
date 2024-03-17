import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/forget_password_model.dart';
import 'package:hkorn_new_dev_vijay/service/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final emailCont = TextEditingController();

  final _key = StackedService.navigatorKey!;

  void navigateToSignIn() {
    _navService.back();
  }

  requestLink() async {
    setBusy(true);

    if (emailCont.text.isEmpty) {
      FlushbarHelper.createError(message: "Please add your email")
          .show(_key.currentContext!);
      return;
    }

    ForgetPassword forgetPassword =
        ForgetPassword(email: emailCont.text.trim());
    Map? data = await _authService.forgetPassword(forgetPassword);
    if (data != null && data['status'] == true) {
      FlushbarHelper.createSuccess(
              message: "Reset password link has been sent.")
          .show(_key.currentContext!);
    } else {
      FlushbarHelper.createSuccess(
              message: "Password reset link not send to email.")
          .show(_key.currentContext!);
    }

    setBusy(false);
  }
}
