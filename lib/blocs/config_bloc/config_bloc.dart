import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc({required Map<String, dynamic> config}) : super(ConfigInitial()) {

    on<LoadConfigFromFirebaseEvent>((event, emit) async {
      emit(ConfigLoadingState());
      final Map<String,dynamic> data = await FirebaseServices().loadConfigFromFirebase();
      config = data[AppConstants.config];
      print(config);
      emit(ConfigLoadedState(config: config));
    });

    on<LoadConfigToFirebaseEvent>((event, emit) async {
      config[AppConstants.appTitle] = event.appTitle;
      config[AppConstants.theme][AppConstants.mainColor] = event.themeMainColor;
      config[AppConstants.theme][AppConstants.fontColor] = event.fontColor;
      config[AppConstants.design][AppConstants.mainColor] = event.designMainColor;
      config[AppConstants.design][AppConstants.padding] = event.padding;
      config[AppConstants.design][AppConstants.circularRadius] = event.circularRadius;
      config[AppConstants.design][AppConstants.singleRadius] = event.circularRadius;
      print("awaiting to upload to firebase");
      await FirebaseServices().loadConfigToFirebase(config);
      add(LoadConfigFromFirebaseEvent());
    });
  }
}
