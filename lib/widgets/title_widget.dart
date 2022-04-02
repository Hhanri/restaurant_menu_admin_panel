import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24
          ),
        ),
      ),
    );
  }
}
