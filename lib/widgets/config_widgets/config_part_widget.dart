import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/title_widget.dart';

class ConfigPartWidget extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  const ConfigPartWidget({
    Key? key,
    required this.title,
    required this.fields
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(text: title),
        PaddingWidget(
          child: Column(
            children: fields,
          ),
        )
      ],
    );
  }
}
