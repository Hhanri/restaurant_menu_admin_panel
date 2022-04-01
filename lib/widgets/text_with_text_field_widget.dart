import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_widget.dart';

class TextWithTextFieldWidget extends StatelessWidget {
  final TextFieldParameters parameters;
  final String text;
  final Function(String) onChange;
  final String value;
  const TextWithTextFieldWidget({
    Key? key,
    required this.text,
    required this.onChange,
    required this.value,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(text: text),
        Expanded(
          child: TextFieldWidget(
            parameters: parameters,
            onChange: (value) {
              onChange(value);
            },
            value: value
          ),
        )
      ],
    );
  }
}
