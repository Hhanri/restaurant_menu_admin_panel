import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ElevatedButtonWidget({
    Key? key,
    required this.onTap,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text)
      ),
    );
  }
}
