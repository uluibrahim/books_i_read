import 'package:books_i_read/core/init/theme/app_theme_dark.dart';
import 'package:books_i_read/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemes { dark, light }

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    changeValue();
  }
  ThemeData? _currentTheme;

  AppThemes? _currenThemeEnum;
  final _themePreference = "theme_preference";

  AppThemes get currenThemeEnum => _currenThemeEnum!;

  ThemeData get currentTheme {
    return _currentTheme ??= AppThemeLight.instance.theme;
  }

  Future<void> changeValue() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    int? prefTheme = sharedPreference.getInt(_themePreference);
    if (prefTheme == null) {
      Brightness systemTheme =
          WidgetsBinding.instance!.window.platformBrightness;
      prefTheme = systemTheme.index;
    }
    if (prefTheme == 1) {
      _currenThemeEnum = AppThemes.light;
      _currentTheme = AppThemeLight.instance.theme;
    } else {
      _currenThemeEnum = AppThemes.dark;
      _currentTheme = AppThemeDark.instance.theme;
    }
    notifyListeners();
  }

  Future<void> changeTheme() async {
    if (_currenThemeEnum == AppThemes.light) {
      _currentTheme = AppThemeDark.instance.theme;
      _currenThemeEnum = AppThemes.dark;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.light;
    }
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themePreference, AppThemes.values.indexOf(_currenThemeEnum!));
    notifyListeners();
  }
}
