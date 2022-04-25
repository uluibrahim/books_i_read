import 'package:books_i_read/core/init/theme/light/i_light_theme.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              color: Colors.transparent,
              iconTheme: const IconThemeData()
                  .copyWith(color: colorSchemeLight!.black54),
              elevation: 0,
              titleTextStyle:
                  TextStyle(color: colorSchemeLight!.black54, fontSize: 20),
            ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(
                foregroundColor: Colors.white,
                backgroundColor: _appColorScheme.primary),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: const ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
      );

  TextTheme get textTheme => ThemeData.light().textTheme.copyWith();

  ColorScheme get _appColorScheme {
    return ColorScheme.light(
      primary: colorSchemeLight!.blue,
      background: const Color(0xfff6f9fc),
      brightness: Brightness.light,
    );
  }
}
