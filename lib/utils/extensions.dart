import 'dart:core';

import 'package:restaurant_menu_back_panel/resources/regexp.dart';

extension RegExpExtension on String {
  bool isPrice() {
    return CustomRegExp.priceRegExp.hasMatch(this) ;
  }
  
  bool isARGB() {
    return CustomRegExp.argbRegExp.hasMatch(this);
  }

  bool isInt() {
    return CustomRegExp.intRegExp.hasMatch(this);
  }

  bool isDouble() {
    return CustomRegExp.doubleRegExp.hasMatch(this);
  }
}

class RegExpFormatters {
  static final RegExp backSlashRegExp = RegExp(r'[\\]');
  static final RegExp priceRegExp = RegExp(r'[0-9\,]');
  static final RegExp hexRegExp = RegExp(r'[A-F 0-9]');
  static final RegExp doubleRegExp = RegExp(r'[0-9\.]');
}

extension HexColor on String {
  String toHex() {
    return "0x$this";
  }
}