class TextThemeDark {
  static TextThemeDark? _instace;
  static TextThemeDark? get instance {
    _instace ??= TextThemeDark._init();
    return _instace;
  }

  TextThemeDark._init();
}
