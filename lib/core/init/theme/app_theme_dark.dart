import 'package:books_i_read/core/init/theme/dark/i_dark_theme.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        canvasColor: colorSchemeDark!.darkBackround,
        colorScheme: _appColorScheme,
        textTheme: textTheme,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              color: colorSchemeDark!.transparent,
              elevation: 0,
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: colorSchemeDark!.black12,
          contentPadding: const EdgeInsets.all(10.0),
          filled: true,
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
          focusedBorder: const OutlineInputBorder(),
        ),
        scaffoldBackgroundColor: colorSchemeDark!.darkBackround,
        floatingActionButtonTheme:
            ThemeData.dark().floatingActionButtonTheme.copyWith(
                  foregroundColor: Colors.white,
                ),
        buttonTheme: ThemeData.dark().buttonTheme.copyWith(
              colorScheme: const ColorScheme.dark(
                onError: Color(0xFF943647),
              ),
            ),
        cardTheme: const CardTheme().copyWith(color: Colors.lightBlue.shade900),
        iconTheme: const IconThemeData().copyWith(size: 30, color: Colors.grey),
      );

  TextTheme get textTheme => ThemeData.dark().textTheme.copyWith();

  ColorScheme get _appColorScheme {
    return ThemeData.dark().colorScheme.copyWith(
          primary: colorSchemeDark!.blue,
          secondary: colorSchemeDark!.azure,
          background: colorSchemeDark!.darkBackround,
          error: colorSchemeDark!.red,
          brightness: Brightness.dark,
        );
  }
}
