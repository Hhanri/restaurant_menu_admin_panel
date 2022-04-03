class CustomRegExp {
  static final RegExp priceRegExp = RegExp(r'^-?(([0-9]*)\,([0-9]{2}))$');
  static final RegExp argbRegExp = RegExp(r'^[A-F 0-9]{8}$');
  static final RegExp intRegExp = RegExp(r'[0-9]');
  static final RegExp doubleRegExp = RegExp(r'^-?(([0-9]*)\.([0-9]+))$');
}