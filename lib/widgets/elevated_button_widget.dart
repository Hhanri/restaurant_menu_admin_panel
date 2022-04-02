import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';

class ElevatedIconButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  const ElevatedIconButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: ElevatedButton.icon(
        onPressed: onTap,
        label: Text(text, textAlign: TextAlign.center,),
        icon: Icon(icon),
      ),
    );
  }
}
