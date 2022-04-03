import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_menu_back_panel/utils/extensions.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String) onChange;
  final String value;
  final TextFieldParameters parameters;
  const TextFieldWidget({
    Key? key,
    required this.onChange,
    required this.value,
    required this.parameters
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
        validator: (String? value) {
          String? res;
          res = parameters.validator(value);
          if (value == null || value.isEmpty) {
            res = "Empty field";
          }
          return res;
        },
        inputFormatters: parameters.formatters,
      ),
    );
  }
}

class TextFieldParameters {
  final Function(String?) validator;
  final List<TextInputFormatter> formatters;

  TextFieldParameters({
    required this.validator,
    required this.formatters
  });
}

class NormalTextFieldParameters extends TextFieldParameters{
  NormalTextFieldParameters() : super(
    validator: (String? value) {
      return null;
    },
    formatters: [
      FilteringTextInputFormatter.deny(RegExpFormatters.backSlashRegExp)
    ]
  );
}

class PriceTextFieldParameters extends TextFieldParameters{
  PriceTextFieldParameters() : super(
    validator: (String? value) {
      if (!value!.isPrice()) {
        return "Only digits";
      }
    },
    formatters: [
      FilteringTextInputFormatter.allow(RegExpFormatters.priceRegExp),
    ]
  );
}

class HexTextFieldParameters extends TextFieldParameters{
  HexTextFieldParameters() : super(
    validator: (String? value) {
      if (!value!.isARGB()) {
        return "Must be ARGB format";
      }
    },
    formatters: [
      FilteringTextInputFormatter.allow(RegExpFormatters.hexRegExp),
      LengthLimitingTextInputFormatter(8)
    ]
  );
}

class IntTextFieldParameters extends TextFieldParameters {
  IntTextFieldParameters() : super(
    validator: (String? value) {
      if (!value!.isInt()) {
        return "Must be an integer";
      }
    },
    formatters: [
      FilteringTextInputFormatter.digitsOnly,
    ]
  );
}

class DoubleTextFieldParameters extends TextFieldParameters {
  DoubleTextFieldParameters() : super(
    validator: (String? value) {
      if (!value!.isDouble()) {
        return "Must be a double (ending at least 1 decimal)";
      }
    },
    formatters: [
      FilteringTextInputFormatter.allow(RegExpFormatters.doubleRegExp),
    ]
  );
}