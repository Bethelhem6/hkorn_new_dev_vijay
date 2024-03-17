import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/login_model.dart';
import 'package:hkorn_new_dev_vijay/model/popup_data_model.dart';
import 'package:hkorn_new_dev_vijay/service/auth_service.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends FutureViewModel {
  bool showPassword = false;
  bool passwordVisible = true;
  bool rememberMe = false;
  final _navService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _sharedService = locator<SharedPrefService>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _key = StackedService.navigatorKey!;

  GlobalKey get formKey => _formKey;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _userService = locator<UserService>();

  List<PopupData> popUpDataList = [];

  String? validatePassword(String val) {
    if (val.isEmpty) {
      return "Password can't be empty";
    } else if (val.length < 6) {
      return "Password is too short";
    }
    return null;
  }

  String? validateEmail(String val) {
    if (val.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  void navigateToCreate() {
    _navService.navigateTo(Routes.signUpView);
  }

  changeRemState(val) {
    rememberMe = val;
    notifyListeners();
  }

  void forgetPassword() {
    _navService.navigateTo(Routes.forgetPasswordView);
  }

  navigateToHome() async {
    // _navService.navigateTo(Routes.newMemberShipView);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      LoginClass loginClass = LoginClass(
          Username: emailController.text.trim(),
          Password: passwordController.text.trim());
      setBusy(true);
      Map? data = await _authService.login(loginClass);
      if (data != null && data['user_id'] != null) {
        var response = {
          'password': passwordController.text.trim(),
          'email': emailController.text.trim(),
          'id': data['user_id'],
        };
        _sharedService.setData(response);
        setBusy(false);

        _navService.clearStackAndShow(Routes.mainView);

        logger.d(data);
      } else {
        FlushbarHelper.createError(
                message: "Login Failed, Wrong email or password")
            .show(_key.currentContext!);
      }

      setBusy(false);
      // }
    }
  }

  toggelPassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      popUpDataList.addAll(data);
    }
  }

  @override
  Future futureToRun() {
    return _userService.getPopUpData();
  }
}
