import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/restaurant_menu_widget.dart';

class RestaurantMenuPageWidget extends StatelessWidget {
  const RestaurantMenuPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
      builder: (context, restaurantMenuState) {
        if (restaurantMenuState is RestaurantMenuLoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (restaurantMenuState is RestaurantMenuLoadedState) {
          List<SectionModel> _sections = BlocProvider.of<RestaurantMenuBloc>(context).sections;
          return RestaurantMenuWidget(
            onUpdate: () {
              context.read<RestaurantMenuBloc>().add(LoadToFirebaseEvent());
            },
            sections: _sections,
          );
        }
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
