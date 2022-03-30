import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String) onChange;
  final String value;
  const TextFieldWidget({
    Key? key,
    required this.onChange,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        initialValue: value,
        onChanged: (value) {
          onChange(value);
        },
        focusNode: FocusNode(),
        enableSuggestions: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
      ),
    );
  }
}
