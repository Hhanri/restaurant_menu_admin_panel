part of 'restaurant_menu_bloc.dart';

abstract class RestaurantMenuEvent {
  const RestaurantMenuEvent();
}

class LoadFromFirebaseEvent extends RestaurantMenuEvent {}

class LoadToFirebaseEvent extends RestaurantMenuEvent {
}

class EditProductEvent extends RestaurantMenuEvent {
  final ProductModel newProduct;
  final int sectionIndex;
  final int productIndex;

  EditProductEvent({
    required this.newProduct,
    required this.sectionIndex,
    required this.productIndex
  });

  @override
  List<Object> get props => [newProduct, sectionIndex, productIndex];
}

class AddProductEvent extends RestaurantMenuEvent {
  final int sectionIndex;

  AddProductEvent({required this.sectionIndex});

  @override
  List<Object> get props => [sectionIndex];
}

class RemoveProductEvent extends RestaurantMenuEvent {
  final int sectionIndex;
  final int productIndex;

  RemoveProductEvent({
    required this.sectionIndex,
    required this.productIndex
  });

  @override
  List<Object> get props => [sectionIndex];
}

class EditSectionName extends RestaurantMenuEvent {
  final String newName;
  final int sectionIndex;

  EditSectionName({
    required this.newName,
    required this.sectionIndex
  });
  @override
  List<Object> get props => [newName, sectionIndex];
}

class RemoveSectionEvent extends RestaurantMenuEvent {
  final int sectionIndex;

  RemoveSectionEvent({required this.sectionIndex});

  @override
  List<Object> get props => [sectionIndex];
}