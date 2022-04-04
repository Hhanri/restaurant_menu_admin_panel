part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityLoadingState extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class ConnectivityNoInternetState extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class ConnectivityYesInternetState extends ConnectivityState {
  @override
  List<Object> get props => [];
}