part of 'restaurant_menu_bloc.dart';

@immutable
abstract class RestaurantMenuState {}

class RestaurantMenuInitialState extends RestaurantMenuState {}

class RestaurantMenuNoInternetState extends RestaurantMenuState {}

class RestaurantMenuLoadingState extends RestaurantMenuState {}

class RestaurantMenuLoadedState extends RestaurantMenuState {
  final List<SectionModel> sections;

  RestaurantMenuLoadedState({required this.sections});

  @override
  List<Object> get props => [sections];
}