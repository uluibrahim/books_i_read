import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instace;
  static ColorSchemeDark? get instance {
    return _instace ??= ColorSchemeDark._init();
  }

  ColorSchemeDark._init();
  final Color red = Colors.red[900]!;
  final Color blue = const Color(0xff00709A);
  final Color darkBackround = const Color(0xff161d31);
  final Color azure = const Color(0xff27928d);
  final Color transparent = Colors.transparent;
  final Color black12 = Colors.black12;
}
