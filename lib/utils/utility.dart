import 'package:connectivity_plus/connectivity_plus.dart';

mixin Utility {
  Future<bool> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // not connected
      return false;
    } else {
      return false;
    }
  }
}