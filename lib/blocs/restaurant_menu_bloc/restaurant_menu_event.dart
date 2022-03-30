part of 'restaurant_menu_bloc.dart';

abstract class RestaurantMenuEvent {
  const RestaurantMenuEvent();
}

class LoadFromFirebaseEvent extends RestaurantMenuEvent {}

class LoadToFirebaseEvent extends RestaurantMenuEvent {
  final List<SectionModel> sections;

  LoadToFirebaseEvent({required this.sections});

  @override
  List<Object> get props => [sections];
}