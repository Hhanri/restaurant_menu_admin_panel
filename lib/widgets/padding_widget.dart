import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  const PaddingWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
