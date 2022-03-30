import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  RestaurantMenuBloc() : super(RestaurantMenuInitialState()) {

    on<LoadFromFirebaseEvent>((event, emit) async {
      emit(RestaurantMenuLoadingState());
      final List<SectionModel> menu = await FirebaseServices().loadMenuFromFirebase();
      emit(RestaurantMenuLoadedState(sections: menu));
    });

    on<LoadToFirebaseEvent>((event, emit) async {
      emit(RestaurantMenuLoadingState());
      await FirebaseServices().loadMenuToFirebase(event.sections);
      add(LoadFromFirebaseEvent());
    });
  }
}
