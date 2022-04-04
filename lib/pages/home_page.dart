import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/connectivity_bloc/connectivity_bloc.dart';
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
      create: (context) => Connectivity(),
      child: BlocProvider(
        create: (context) => ConnectivityBloc(RepositoryProvider.of<Connectivity>(context)),
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
            if (state is ConnectivityYesInternetState) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 900) {
                    return const MobileViewScreen();
                  } else {
                    return const DesktopViewScreen();
                  }
                },
              );
            }
            if (state is ConnectivityNoInternetState) {
              return const NoInternetScreen();
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}