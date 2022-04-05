import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu_back_panel/services/connectivity_service.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityService connectivity;
  ConnectivityBloc({required this.connectivity}) : super(ConnectivityNoInternetState()) {

    connectivity.getResult.then((event) {
      if (event == ConnectivityResult.none) {
        print("no internet");
        add(ConnectivityNoInternetEvent());
      } else {
        add(ConnectivityYesInternetEvent());
      }
    });

    connectivity.connectivityStream.stream.listen((result) {
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
