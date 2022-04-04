import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/config_bloc/config_bloc.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/utils/extensions.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/design_fields_config_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/general_fields_config_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/theme_fields_config_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/title_widget.dart';

class ConfigWidget extends StatelessWidget {
  final String appTitle;
  final String themeMainColor;
  final String fontColor;
  final String designMainColor;
  final double padding;
  final int circularRadius;
  const ConfigWidget({
    Key? key,
    required this.appTitle,
    required this.themeMainColor,
    required this.fontColor,
    required this.designMainColor,
    required this.padding,
    required this.circularRadius
  }) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _appTitle = appTitle;
    String _themeMainColor = themeMainColor;
    String _fontColor = fontColor;
    String _designMainColor = designMainColor;
    double _padding = padding;
    int _circularRadius = circularRadius;

    void updateConfig() {
      BlocProvider
        .of<ConfigBloc>(context)
        .add(LoadConfigToFirebaseEvent(
        appTitle: _appTitle,
        themeMainColor: _themeMainColor.toHex(),
        fontColor: _fontColor.toHex(),
        designMainColor: _designMainColor.toHex(),
        padding: _padding,
        circularRadius: _circularRadius)
      );
    }

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleWidget(text: TitleStrings.settings),
            GeneralFieldsConfigWidget(
              appTitleValue: _appTitle,
              appTitleOnChange: (String value) {
                _appTitle = value;
              }
            ),
            ThemeFieldsConfigWidget(
              themeMainColorValue: _themeMainColor,
              themeMainColorOnChange: (String value) {
                _themeMainColor = value;
              },
              fontColorValue: _fontColor,
              fontColorOnChange: (String value) {
                _fontColor = value;
              }
            ),
            DesignFieldsConfigWidget(
              designMainColorValue: _designMainColor,
              designMainColorOnChange: (String value) {
                _designMainColor = value;
              },
              paddingValue: _padding,
              paddingOnChange: (String value) {
                _padding = double.parse(value);
              },
              circularRadiusValue: _circularRadius,
              circularRadiusOnChange: (String value) {
                _circularRadius = int.parse(value);
              },
            ),
            ElevatedIconButtonWidget(
              icon: Icons.upload,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  updateConfig();
                }
              },
              text: TitleStrings.update,
            )
          ],
        ),
      ),
    );
  }
}
