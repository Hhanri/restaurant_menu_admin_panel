import 'dart:core';

import 'package:restaurant_menu_back_panel/resources/regexp.dart';

extension RegExpExtension on String {

  bool isPrice() {
    return CustomRegExp.priceRegExp.hasMatch(this) ;
  }
  
  bool isARGB() {
    return CustomRegExp.argbRegExp.hasMatch(this);
  }
}