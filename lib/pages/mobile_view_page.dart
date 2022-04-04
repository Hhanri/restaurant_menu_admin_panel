import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/mobile_view_bloc/mobile_view_bloc.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/config_page_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/menu_page_widget.dart';

class MobileViewScreen extends StatelessWidget {
  const MobileViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MobileViewBloc()..add(DisplayRestaurantMenuPageEvent()),
      child: BlocBuilder<MobileViewBloc, MobileViewState>(
        builder: (context, state) {
          return Scaffold(
            body: (state is RestaurantMenuPageState)
                ? const RestaurantMenuPageWidget()
                : const ConfigPageWidget(),
            bottomNavigationBar: BottomNavigationBarWidget(
              index: (state is RestaurantMenuPageState) ? 0 : 1,
              onTap: (int itemIndex) {
                if (itemIndex == 0) {
                  BlocProvider.of<MobileViewBloc>(context).add(DisplayRestaurantMenuPageEvent());
                }
                if (itemIndex == 1) {
                  BlocProvider.of<MobileViewBloc>(context).add(DisplayConfigPageEvent());
                }
              },
            ),
          );
        },
      ),
    );
  }
}


class BottomNavigationBarWidget extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  const BottomNavigationBarWidget({
    Key? key,
    required this.onTap,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: TitleStrings.menu),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: TitleStrings.settings),
      ],
      currentIndex: index,
      onTap: (itemIndex) {
        onTap(itemIndex);
      },
    );
  }
}
