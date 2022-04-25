import 'package:books_i_read/core/init/theme/light/color_scheme_ligth.dart';
import 'package:books_i_read/core/init/theme/light/text_theme_ligth.dart';

abstract class ILightTheme {
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  ColorSchemeLight? colorSchemeLight = ColorSchemeLight.instance;
}
