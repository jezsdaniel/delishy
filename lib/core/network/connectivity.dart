import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityService {
  ConnectivityService() {
    InternetConnectionChecker().onStatusChange.listen((event) {
      connectionStatus = _networkStatus(event);

      connectivityController.add(connectionStatus);
    });
  }

  BehaviorSubject<ConnectionStatus> connectivityController = BehaviorSubject();
  ConnectionStatus connectionStatus = ConnectionStatus.offline;

  ConnectionStatus _networkStatus(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        return ConnectionStatus.online;

      case InternetConnectionStatus.disconnected:
        return ConnectionStatus.offline;
    }
  }
}

enum ConnectionStatus {
  online,
  offline,
}
