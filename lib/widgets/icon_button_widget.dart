import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  const IconButtonWidget({
    Key? key,
    required this.onPress,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(icon)
    );
  }
}
