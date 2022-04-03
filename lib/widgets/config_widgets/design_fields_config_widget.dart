import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/config_part_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/divider_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class DesignFieldsConfigWidget extends StatelessWidget {
  final String designMainColorValue;
  final Function(String) designMainColorOnChange;
  final double paddingValue;
  final Function(String) paddingOnChange;
  final int circularRadiusValue;
  final Function(String) circularRadiusOnChange;
  const DesignFieldsConfigWidget({
    Key? key,
    required this.designMainColorValue,
    required this.designMainColorOnChange,
    required this.paddingValue,
    required this.paddingOnChange,
    required this.circularRadiusValue,
    required this.circularRadiusOnChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigPartWidget(
      title: 'Theme',
      fields: [
        TextWithTextFieldWidget(
          text: AppConstants.mainColor,
          onChange: (String value) {
            designMainColorOnChange(value);
          },
          value: designMainColorValue,
          parameters: HexTextFieldParameters(),
        ),
        TextWithTextFieldWidget(
          text: AppConstants.padding,
          onChange: (String value) {
            paddingOnChange(value);
          },
          value: paddingValue.toString(),
          parameters: DoubleTextFieldParameters(),
        ),
        TextWithTextFieldWidget(
          text: AppConstants.circularRadius,
          onChange: (String value) {
            circularRadiusOnChange(value);
          },
          value: circularRadiusValue.toString(),
          parameters: IntTextFieldParameters(),
        ),
        const DividerWidget()
      ],
    );
  }
}
