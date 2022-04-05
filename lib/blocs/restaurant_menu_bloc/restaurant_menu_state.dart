part of 'restaurant_menu_bloc.dart';

@immutable
abstract class RestaurantMenuState{
  const RestaurantMenuState();
}

class RestaurantMenuInitialState extends RestaurantMenuState {
}

class RestaurantMenuLoadingState extends RestaurantMenuState {
}

class RestaurantMenuLoadedState extends RestaurantMenuState {
  final List<SectionModel> sections;

  const RestaurantMenuLoadedState({required this.sections});
}