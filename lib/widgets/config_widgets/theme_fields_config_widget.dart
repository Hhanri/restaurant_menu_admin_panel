import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/config_part_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/divider_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class ThemeFieldsConfigWidget extends StatelessWidget {
  final String themeMainColorValue;
  final Function(String) themeMainColorOnChange;
  final String fontColorValue;
  final Function(String) fontColorOnChange;
  const ThemeFieldsConfigWidget({
    Key? key,
    required this.themeMainColorValue,
    required this.themeMainColorOnChange,
    required this.fontColorValue,
    required this.fontColorOnChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigPartWidget(
      title: TitleStrings.theme,
      fields: [
        TextWithTextFieldWidget(
          text: AppConstants.mainColor,
          onChange: (String value) {
            themeMainColorOnChange(value);
          },
          value: themeMainColorValue,
          parameters: HexTextFieldParameters(),
        ),
        TextWithTextFieldWidget(
          text: AppConstants.fontColor,
          onChange: (String value) {
            fontColorOnChange(value);
          },
          value: fontColorValue,
          parameters: HexTextFieldParameters(),
        ),
        const DividerWidget()
      ],
    );
  }
}