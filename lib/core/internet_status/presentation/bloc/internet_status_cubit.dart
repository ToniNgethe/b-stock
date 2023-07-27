import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

enum ConnectivityStatus {
  connected,
  notConnected,
  none;
}

@injectable
class InternetStatusCubit extends Cubit<ConnectivityStatus> {
  StreamSubscription? _streamSubscription;

  InternetStatusCubit() : super(ConnectivityStatus.none) {
    listenToConnection();
  }

  void getCurrentStatus() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityStatus.notConnected);
    } else {
      emit(ConnectivityStatus.connected);
    }
  }

  /// The function `listenToConnection` listens for changes in connectivity and
  /// emits the corresponding status.
  void listenToConnection() {
    _streamSubscription?.cancel();
    _streamSubscription = Connectivity().onConnectivityChanged.listen((
        ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityStatus.notConnected);
      } else {
        emit(ConnectivityStatus.connected);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
