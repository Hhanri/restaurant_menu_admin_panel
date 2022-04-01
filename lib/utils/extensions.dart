import 'dart:core';

extension RegExpExtension on String {

  bool isNumeric() {
    return RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$').hasMatch(this);
  }
  
  bool isARGB() {
    return RegExp(r'([A-F 0-9])').hasMatch(this) && length == 8;
  }
}