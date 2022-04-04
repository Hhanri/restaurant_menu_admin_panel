import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/pages/desktop_view_page.dart';
import 'package:restaurant_menu_back_panel/pages/mobile_view_page.dart';
import 'package:restaurant_menu_back_panel/pages/no_internet_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return NoInternetScreen();
        if (constraints.maxWidth < 900) {
          return const MobileViewScreen();
        } else {
          return const DesktopViewScreen();
        }
      },
    );
  }
}