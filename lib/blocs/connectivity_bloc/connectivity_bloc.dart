import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu_back_panel/services/connectivity_service.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  ConnectivityBloc(this._connectivity) : super(ConnectivityLoadingState()) {
    print("internet bloc");

    _connectivity.checkConnectivity().then((result) {
      print("checking internet");
      if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile || result == ConnectivityResult.ethernet) {
        print("yes internet");
        add(ConnectivityYesInternetEvent());
      } else {
        add(ConnectivityNoInternetEvent());
      }
    });

    _connectivity.onConnectivityChanged.listen((event) async {
      print("listening");
      if (event == ConnectivityResult.none) {
        add(ConnectivityNoInternetEvent());
      } else {
        add(ConnectivityYesInternetEvent());
      }
    });

    on<ConnectivityYesInternetEvent>((event, emit) {
      emit(ConnectivityYesInternetState());
    });

    on<ConnectivityNoInternetEvent>((event, emit) {
      emit(ConnectivityNoInternetState());
    });
  }
}
