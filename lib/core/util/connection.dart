import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionChecker {
  Future<bool> hasConnection();
}

class ConnectivityCheckerImpl implements ConnectionChecker {
  @override
  Future<bool> hasConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    }

    return false;
  }
}

class ConnectionCore {
  final ConnectionChecker connectionChecker;

  ConnectionCore({required this.connectionChecker});

  Future<bool> hasConnection() async =>
      (await connectionChecker.hasConnection()) ? true : false;
}
