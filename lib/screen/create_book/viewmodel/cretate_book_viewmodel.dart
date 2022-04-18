import 'package:books_i_read/locator.dart';
import 'package:books_i_read/product/enum/view_state.dart';
import 'package:flutter/material.dart';

class CreateBookViewmodel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
