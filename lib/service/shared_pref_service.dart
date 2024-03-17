import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class SharedPrefService {
  Future<void> setSplashScreenShown() async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setBool('splashShown', true);
  }

  Future<bool> getSplashScreenShown() async {
    final preferences = await StreamingSharedPreferences.instance;
    return preferences.getBool('splashShown', defaultValue: false).getValue();
  }

  Future<void> removeSplashScreenShown() async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setBool('splashShown', false);
  }

  Future<void> setData(
    Map responseData,
  ) async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setString('password', responseData['password']);
    preferences.setString('email', responseData['email']);
    preferences.setInt('id', responseData['id']);
    logger.d(responseData);
  }

  Future<void> clearStored() async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.clear();
    preferences.setString('password', 'defaultValue');
    preferences.setString('email', 'defaultValue');
    preferences.setInt('id', 0);
  }

  // 8098994912

  Future<Map> getStoredData() async {
    // clearStored();
    final preferences = await StreamingSharedPreferences.instance;

    Map storedData = {
      'email': preferences
          .getString('email', defaultValue: 'defaultValue')
          .getValue(),
      'password': preferences
          .getString('password', defaultValue: 'defaultValue')
          .getValue(),
      'id': preferences.getInt('id', defaultValue: 0).getValue(),
    };

    return storedData;
  }
}
