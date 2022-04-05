import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/config_bloc/config_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/mobile_view_bloc/mobile_view_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/pages/desktop_view_page.dart';
import 'package:restaurant_menu_back_panel/pages/loading_screen.dart';
import 'package:restaurant_menu_back_panel/pages/mobile_view_page.dart';
import 'package:restaurant_menu_back_panel/pages/no_internet_page.dart';
import 'package:restaurant_menu_back_panel/services/connectivity_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ConnectivityService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ConnectivityBloc(connectivity: RepositoryProvider.of<ConnectivityService>(context))),
          BlocProvider(create: (context) => RestaurantMenuBloc(sections: [])),
          BlocProvider(create: (context) => MobileViewBloc()..add(DisplayRestaurantMenuPageEvent())),
          BlocProvider(create: (context) => ConfigBloc(config: {}))
        ],
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, connectivityState) {
            if (connectivityState is ConnectivityYesInternetState) {
              BlocProvider.of<ConfigBloc>(context).add(LoadConfigFromFirebaseEvent());
              BlocProvider.of<RestaurantMenuBloc>(context).add(LoadFromFirebaseEvent());
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 900) {
                    return const MobileViewScreen();
                  } else {
                    return const DesktopViewScreen();
                  }
                },
              );
            } else if (connectivityState is ConnectivityNoInternetState) {
              return const NoInternetScreen();
            } else {
              return const LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}