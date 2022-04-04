part of 'restaurant_menu_bloc.dart';

abstract class RestaurantMenuEvent extends Equatable{
  const RestaurantMenuEvent();
}

class LoadFromFirebaseEvent extends RestaurantMenuEvent {
  @override
  List<Object?> get props => throw [];
}

class LoadToFirebaseEvent extends RestaurantMenuEvent {
  @override
  List<Object?> get props => throw [];
}

class EditProductEvent extends RestaurantMenuEvent {
  final ProductModel newProduct;
  final int sectionIndex;
  final int productIndex;

  const EditProductEvent({
    required this.newProduct,
    required this.sectionIndex,
    required this.productIndex
  });

  @override
  List<Object> get props => [newProduct, sectionIndex, productIndex];
}

class AddProductEvent extends RestaurantMenuEvent {
  final int sectionIndex;

  const AddProductEvent({required this.sectionIndex});

  @override
  List<Object> get props => [sectionIndex];
}

class RemoveProductEvent extends RestaurantMenuEvent {
  final int sectionIndex;
  final int productIndex;

  const RemoveProductEvent({
    required this.sectionIndex,
    required this.productIndex
  });

  @override
  List<Object> get props => [sectionIndex, productIndex];
}

class EditSectionName extends RestaurantMenuEvent {
  final String newName;
  final int sectionIndex;

  const EditSectionName({
    required this.newName,
    required this.sectionIndex
  });
  @override
  List<Object> get props => [newName, sectionIndex];
}

class RemoveSectionEvent extends RestaurantMenuEvent {
  final int sectionIndex;

  const RemoveSectionEvent({required this.sectionIndex});

  @override
  List<Object> get props => [sectionIndex];
}

class AddSectionEvent extends RestaurantMenuEvent {
  @override
  List<Object?> get props => throw [];
}