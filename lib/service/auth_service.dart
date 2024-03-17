import 'package:flutter/foundation.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/create_view_model.dart';
import 'package:hkorn_new_dev_vijay/model/forget_password_model.dart';
import 'package:hkorn_new_dev_vijay/model/login_model.dart';

import 'package:hkorn_new_dev_vijay/model/user_model.dart';
import 'package:hkorn_new_dev_vijay/repo/auth_rep.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';

class AuthService {
  final AuthRepo<Map> _repo = AuthRepo();
  final _sharedService = locator<SharedPrefService>();

  Future<Map?> login(LoginClass model) async {
    Map? dataResponse = await _repo.postRequestForLogin(
        email: model.Username, password: model.Password);
    return dataResponse;
  }

  Future<Map?> createAccount(CreateUserModel model) async {
    try {
      Map? data = await _repo.postRequest(
          keyWord: '', requiresAuth: false, url: 'signup', data: model.toMap());
      logger.d(data);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print('Error====$e');
      }
    }
    return null;
  }

  Future<Map?> forgetPassword(ForgetPassword model) async {
    Map? data = await _repo.postRequest(
        keyWord: '',
        requiresAuth: false,
        url: 'forgot_password',
        data: model.toMap());
    logger.d(data);
    return data;
  }

  Future<UserModel?> getUserInfo() async {
    final _repo = AuthRepo<Map?>();
    Map storedData = await _sharedService.getStoredData();
    Map? data = await _repo.postRequest(
        requiresAuth: false,
        url: 'user_profile',
        keyWord: 'data',
        data: {'user_id': storedData['id']});

    // logger.d(data);
    return data == null ? null : UserModel.fromMap(data);
  }
}
