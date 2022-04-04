import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu_back_panel/services/connectivity_service.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityService _connectivity;
  ConnectivityBloc(this._connectivity) : super(ConnectivityYesInternetState()) {
    _connectivity.connectivityStream.stream.listen((result) {
      if (result == ConnectivityResult.none) {
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
