import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/utils/utility.dart';


class BaseRepository with Utility {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();
  final String baseUrl = 'https://bidexpress-app.azurewebsites.net/api/';
  final int id = 1;
  final String clientSecret = 'JSHpAJgG5XAupLAZrwmENOBZCinrcFKsF08td8uh';

  Future<String> getAccessToken() async {
    try {
      final String token =
          await _sharedPreferenceHelper.getStringValue(key: 'token');
      return token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getRefreshToken() async {
    try {
      final String token =
          await _sharedPreferenceHelper.getStringValue(key: 'refresh_token');
      return token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getFcmToken() async {
    try {
      final String _token =
          await _sharedPreferenceHelper.getStringValue(key: 'fcm_token');
      print('fcmToken : $_token');
      return _token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getDeviceId() async {
    try {
      final String _deviceId =
          await _sharedPreferenceHelper.getStringValue(key: 'device_id');
      print('deviceId : $_deviceId');
      return _deviceId;
    } catch (e) {
      return '';
    }
  }
}
