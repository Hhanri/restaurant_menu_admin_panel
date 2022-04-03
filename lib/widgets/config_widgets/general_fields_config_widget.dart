import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/config_part_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/divider_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class GeneralFieldsConfigWidget extends StatelessWidget {
  final String appTitleValue;
  final Function(String) appTitleOnChange;
  const GeneralFieldsConfigWidget({
    Key? key, required this.appTitleValue,
    required this.appTitleOnChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigPartWidget(
      title: TitleStrings.general,
      fields: [
        TextWithTextFieldWidget(
          text: AppConstants.appTitle,
          onChange: (String value) {
            appTitleOnChange(value);
          },
          value: appTitleValue,
          parameters: NormalTextFieldParameters(),
        ),
        const DividerWidget()
      ],
    );
  }
}
