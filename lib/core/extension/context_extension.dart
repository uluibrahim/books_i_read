import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get shortestSide => mediaQuery.size.shortestSide;
  Orientation get orientation => mediaQuery.orientation;
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0 ? true : false;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.05;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get paddingLowHorizontalAndVertical =>
      EdgeInsets.symmetric(horizontal: lowValue, vertical: lowValue);
  EdgeInsets get paddingMediumHorizontalAndVertical =>
      EdgeInsets.symmetric(horizontal: mediumValue, vertical: mediumValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingLowTop => const EdgeInsets.only(top: 10);
  EdgeInsets get paddingLowBottom => const EdgeInsets.only(bottom: 10);
  EdgeInsets get paddingLowLeft => const EdgeInsets.only(left: 10);
  EdgeInsets get paddingLowRight => const EdgeInsets.only(right: 10);
}
