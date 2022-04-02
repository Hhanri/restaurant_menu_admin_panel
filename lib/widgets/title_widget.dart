import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24
        ),
      ),
    );
  }
}
