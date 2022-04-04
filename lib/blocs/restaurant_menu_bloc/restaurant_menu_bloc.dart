import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  List<SectionModel> sections;
  RestaurantMenuBloc({required this.sections}) : super(RestaurantMenuInitialState()) {

    on<LoadFromFirebaseEvent>((event, emit) async {
      emit(RestaurantMenuLoadingState());
      final List<SectionModel> menu = await FirebaseServices().loadMenuFromFirebase();
      sections = menu;
      emit(RestaurantMenuLoadedState(sections: menu));
    });

    on<LoadToFirebaseEvent>((event, emit) async {
      emit(RestaurantMenuLoadingState());
      await FirebaseServices().loadMenuToFirebase(sections);
      add(LoadFromFirebaseEvent());
    });

    on<EditProductEvent>((event, emit) {
      sections[event.sectionIndex].products[event.productIndex] = event.newProduct;
      //emit(RestaurantMenuLoadedState(sections: sections));
    });

    on<AddProductEvent>((event, emit) {
      sections[event.sectionIndex].products.add(const ProductModel(productName: "", price: ""));
      emit(RestaurantMenuLoadedState(sections: sections));
    });

    on<RemoveProductEvent>((event, emit) {
      sections[event.sectionIndex].products.removeAt(event.productIndex);
      emit(RestaurantMenuLoadedState(sections: sections));
    });

    on<RemoveSectionEvent>((event, emit) {
      sections.removeAt(event.sectionIndex);
      emit(RestaurantMenuLoadedState(sections: sections));
    });

    on<AddSectionEvent>((event, emit) {
      sections.add(SectionModel.defaultSectionModel);
      emit(RestaurantMenuLoadedState(sections: sections));
    });
  }
}
