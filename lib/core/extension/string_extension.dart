extension ValidatorString on String{
    bool isValidNumber() {
    return RegExp(r'^[0-9]+$',
            dotAll: true, unicode: true, caseSensitive: false)
        .hasMatch(this);
  }
}