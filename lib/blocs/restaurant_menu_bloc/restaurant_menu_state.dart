part of 'restaurant_menu_bloc.dart';

@immutable
abstract class RestaurantMenuState{
  const RestaurantMenuState();
}

class RestaurantMenuInitialState extends RestaurantMenuState {
  @override
  List<Object?> get props => throw [];
}

class RestaurantMenuLoadingState extends RestaurantMenuState {
  @override
  List<Object?> get props => throw [];
}

class RestaurantMenuLoadedState extends RestaurantMenuState {
  final List<SectionModel> sections;

  const RestaurantMenuLoadedState({required this.sections});

  @override
  List<Object> get props => [sections];
}