import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/config_bloc/config_bloc.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/utils/extensions.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/general_fields_config_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/config_widgets/theme_fields_config_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            GeneralFieldsConfigWidget(
              appTitleValue: _appTitle,
              appTitleOnChange: (String value) {
                _appTitle = value;
                print(_themeMainColor);
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
