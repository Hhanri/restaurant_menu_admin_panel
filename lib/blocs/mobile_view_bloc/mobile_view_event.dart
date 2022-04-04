part of 'mobile_view_bloc.dart';

abstract class MobileViewEvent extends Equatable {
  const MobileViewEvent();
}

class DisplayConfigPageEvent extends MobileViewEvent {
  @override
  List<Object?> get props => throw [];
}

class DisplayRestaurantMenuPageEvent extends MobileViewEvent {
  @override
  List<Object?> get props => throw [];
}