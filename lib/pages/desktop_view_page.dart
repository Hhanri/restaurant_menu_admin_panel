import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/config_page_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/menu_page_widget.dart';

class DesktopViewScreen extends StatelessWidget {
  const DesktopViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
            flex: 1,
            child: ConfigPageWidget()
          ),
          Expanded(
            flex: 2,
            child: RestaurantMenuPageWidget()
          )
        ],
      ),
    );
  }
}
