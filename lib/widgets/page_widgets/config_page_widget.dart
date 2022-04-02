import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/config_bloc/config_bloc.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/config_widget.dart';

class ConfigPageWidget extends StatelessWidget {
  const ConfigPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfigBloc(config: {})..add(LoadConfigFromFirebaseEvent()),
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          if (state is ConfigLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ConfigLoadedState) {
            final String _appTitle = state.config[AppConstants.appTitle];
            final String _themeMainColor = state.config[AppConstants.theme][AppConstants.mainColor].replaceAll("0x", "");
            final String _fontColor = state.config[AppConstants.theme][AppConstants.fontColor].replaceAll("0x", "");
            final String _designMainColor = state.config[AppConstants.design][AppConstants.mainColor].replaceAll("0x", "");
            final double _padding = state.config[AppConstants.design][AppConstants.padding];
            final int _circularRadius = state.config[AppConstants.design][AppConstants.circularRadius];
            return ConfigWidget(
              appTitle: _appTitle,
              themeMainColor: _themeMainColor,
              fontColor: _fontColor,
              designMainColor: _designMainColor,
              padding: _padding,
              circularRadius: _circularRadius
            );
          }
          return const Center(
            child: Icon(Icons.error),
          );
        },
      )
    );
  }
}