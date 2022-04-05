part of 'connectivity_bloc.dart';

abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnectivityNoInternetState extends ConnectivityState {
}

class ConnectivityYesInternetState extends ConnectivityState {
}