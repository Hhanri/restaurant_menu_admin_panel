part of 'connectivity_bloc.dart';

abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnectivityNoInternetState extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class ConnectivityYesInternetState extends ConnectivityState {
  @override
  List<Object> get props => [];
}