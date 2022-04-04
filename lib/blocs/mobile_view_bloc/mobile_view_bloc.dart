import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mobile_view_event.dart';
part 'mobile_view_state.dart';

class MobileViewBloc extends Bloc<MobileViewEvent, MobileViewState> {
  MobileViewBloc() : super(MobileViewInitial()) {

    on<DisplayConfigPageEvent>((event, emit) {
      emit(ConfigPageState());
    });

    on<DisplayRestaurantMenuPageEvent>((event, emit) {
      emit(RestaurantMenuPageState());
    });
  }
}
