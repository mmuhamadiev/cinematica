import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity;
  StreamSubscription? streamSubscription;

  InternetCubit(this.connectivity) : super(InternetInitial()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) async{
      print(event);
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi || event == ConnectivityResult.other) {
        emit(InternetOnState());
      } else {
        emit(InternetOffState());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
