part of 'mobile_view_bloc.dart';

abstract class MobileViewState extends Equatable {
  const MobileViewState();
}

class MobileViewInitial extends MobileViewState {
  @override
  List<Object> get props => [];
}

class ConfigPageState extends MobileViewState {
  @override
  List<Object?> get props => throw [];
}

class RestaurantMenuPageState extends MobileViewState {
  @override
  List<Object?> get props => throw [];
}