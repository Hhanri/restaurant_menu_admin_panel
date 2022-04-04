import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/config_page_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/menu_page_widget.dart';

class DesktopViewScreen extends StatelessWidget {
  const DesktopViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: ConfigPageWidget()),
        Expanded(child: RestaurantMenuPageWidget())
      ],
    );
  }
}
