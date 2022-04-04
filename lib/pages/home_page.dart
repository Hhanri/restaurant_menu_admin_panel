import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/pages/desktop_view_page.dart';
import 'package:restaurant_menu_back_panel/pages/mobile_view_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MobileViewScreen(),
    );
  }
}