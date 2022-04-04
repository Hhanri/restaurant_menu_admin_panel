part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class ConnectivityNoInternetEvent extends ConnectivityEvent {
  @override
  List<Object> get props => [];
}

class ConnectivityYesInternetEvent extends ConnectivityEvent {
  @override
  List<Object> get props => [];
}