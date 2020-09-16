import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  bool _dark = false;
  bool get dark => _dark;
  toggleTheme() {
    _dark = !_dark;
    notifyListeners();
  }
}
